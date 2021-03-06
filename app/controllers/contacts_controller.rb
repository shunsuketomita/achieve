class ContactsController < ApplicationController
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end
  
  def create
    @contact = Contact.create(contacts_params)
      if @contact.save
      # 一覧画面へ遷移して"お問い合わせありがとうございました！"とメッセージを表示します。
      redirect_to root_path, notice: "お問い合わせありがとうございました！"
      else
      # 入力フォームを再描画します。
      render 'new'
      end
  end
  
def confirm
  @contact = Contact.new(contacts_params)
  render :new if @contact.invalid?
end
  
private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
