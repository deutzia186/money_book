require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    before do
      login user
    end
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:params) { { book: attributes_for(:book) } }
    context 'ログインができた場合' do
      before do
        login user
      end
      context '保存に成功した場合' do
        subject {
          post :create,
          params: params
        }
        it "bookを保存すること" do
          expect{ subject }.to change(Book, :count).by(1)
        end
        it "明細一覧ページに遷移すること" do
          subject
          expect(response).to redirect_to(lists_path)
        end
      end
      context '保存に失敗した場合' do
        let(:invalid_params) { { book: attributes_for(:book, date: nil, price: nil, category_id: nil) } }
        subject {
          post :create,
          params: invalid_params
        }
        it "bookが保存されないこと" do
          expect{ subject }.not_to change(Book, :count)
        end
        it "トップページに遷移すること" do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
    end
    context 'ログインができなかった場合' do
      it "ユーザー登録ページに遷移すること" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    before do
      @user = create(:user)
      @book = @user.books.create(
        date: "2020-06-01 15:00:00",
        price: "1000",
        category_id: 5
        )
    end
    context '権限のあるユーザーでログインしている場合' do
      it "@bookに正しい値が入っていること" do
        sign_in @user
        get :edit, params: { id: @book}
        expect(assigns(:book)).to eq @book
      end
      it "edit.htmal.hamlに遷移すること" do
        sign_in @user
        get :edit, params: { id: @book}
        expect(response).to render_template :edit
      end
    end
    context '権限のないユーザーでログインしている場合' do
      it "ログインしているユーザーの明細一覧へ遷移すること" do
        login user
        get :edit, params: { id: @book}
        expect(response).to redirect_to lists_path
      end
    end
  end

  describe 'PATCH #update' do
    it "正常にbookを更新できること" do
      login user
      book = create(:book)
      book_update = { date: '2020-08-01 12:00:00.000000000 +0900', price:'2000', category_id:'10' }
      patch :update, params: {id: book, book: book_update}
      expect(book.reload.date).to eq('2020-08-01 12:00:00.000000000 +0900')
      expect(book.reload.price).to eq(2000)
      expect(book.reload.category_id).to eq(10)
    end
    it "bookを更新した後、book一覧ページに遷移できること" do
      login user
      book = create(:book)
      book_update = { date: '2020-08-01 12:00:00.000000000 +0900', price: '2000', category_id: '10' }
      patch :update, params: {id: book, book: book_update}
      expect(response).to redirect_to lists_path
    end
    it "不正なアトリビュートであると更新できなくなっていること" do
      login user
      book = create(:book)
      book_update = { date: 'nil',  price: 'nil', category_id: 'nil'}
      patch :update, params: {id: book, book: book_update}
      expect(book.reload.date).not_to eq(nil)
      expect(book.reload.price).not_to eq(nil)
      expect(book.reload.category_id).not_to eq(nil)
    end
    it "不正なアトリビュートであると再度更新ページにリダイレクトされること" do
      login user
      book = create(:book)
      book_update = { date: 'nil',  price: 'nil', category_id: 'nil'}
      patch :update, params: {id: book, book: book_update}
      expect(response).to redirect_to edit_book_path
    end
  end
  describe 'DELETE #destroy' do
    before do
      @user = create(:user)
      @book = @user.books.create(
        date: "2020-06-01 15:00:00",
        price: "1000",
        category_id: 5
        )
    end
    context '権限のあるユーザーでログインしている場合' do
      subject {
        delete :destroy,
        params: {id: @book}
      }
      it "bookが削除されること" do
        sign_in @user
        expect{ subject }.to change(Book, :count).by(-1)
      end
      it "削除後、詳細一覧ページにリダイレクトされること"do
        sign_in @user
        delete :destroy, params: {id: @book}
        expect(response).to redirect_to lists_path
      end
    end
  end
end