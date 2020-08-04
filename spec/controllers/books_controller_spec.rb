require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'POST #create' do
    let(:params) { { book: attributes_for(:book) } }

    context 'ログインしている場合' do
      before do
        login user
      end

      context '保存に成功した場合' do
        subject {
          post :create,
          params: params
        }

        it 'bookを保存すること' do
          expect{ subject }.to change(Book, :count).by(1)
        end

      end
    end
  end



  describe 'GET #edit' do
    it "@bookに正しい値が入っていること" do
      book = create(:book)
      get :edit, params: { id: book}
      expect(assigns(:book)).to eq book
    end

    it "edit.htmal.hamlに遷移すること" do
      book = create(:book)
      get :edit, params: { id: book}
      expect(response).to render_template :edit
    end
  end
end