class AccountsController < ApplicationController
  # show, edit, update, destroy 페이지는 계정키의 id 정보가 하나씩 필요하므로 action 전에 하단에 set_account 설정
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  # GET /accounts => 모든 계정키 조회
  def index
    @accounts = Account.all
    @cate_key = params[:cate]
  end

  # GET /accounts/1 => 하나의 계정키 조회
  def show
    redirect_to accounts_path
  end

  # GET /accounts/new => 새로운 계정키 입력 페이지 이동
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit => 기존 계정키 수정 페이지 이동
  def edit
  end

  # POST /accounts => 새로운 계정키 생성
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to home_index_path }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 => 기존 계정키 변경
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: '계정키가 변경되었습니다!' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 => 기존 계정키 삭제
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: '계정키가 삭제되었습니다!' }
      format.json { head :no_content }
    end
  end
  
  def category
  
  end
  
  def editform
    @account = Account.find(params[:id])
  end

  private
    # 액션을 실행하기 전, 해당 계정키를 가져와서 @account에 설정
    def set_account
      @account = Account.find(params[:id])
    end

    # 사용자가 새로운 계정키를 추가할 때, 보내는 입력 데이터 (계정용도, 아이디, 비번, 설명)
    def account_params
      params.require(:account).permit(:keycate, :keyname, :keyid, :keypw, :keydesc, :user_id)
    end
end
