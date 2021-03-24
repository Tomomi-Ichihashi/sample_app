#frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト'　do
  let!(:list) {create(:list,title:'hoge',body:'body')}
end

describe 'トップ画面(top_path)のテスト' do
  before do
    visit top_path
  end
  
  context '表示の確認' do
    it 'トップ画面(top_path)に「ここはTopページです」が表示されているか' do
      expect(page).to have_conten 'ここはTopページです'
    end
    
    it 'top_pathが"/top"であるか' do
      expect(current_path).to eq('/top')
    end
  end
end

describe '投稿画面のテスト' do
  before do
    visit  todolists_new_path
  end
  
  context '投稿画面への遷移' do
    it 'todolists_new_pathが"/todolists/new"であるか' do
      expect(current_path).to eq('/todolists/new')
    end
    it '投稿ボタンが表示されているか' do
      expect(page).to have_button '投稿'
    end
  end
  
  context '投稿処理のテスト' do
    it '投稿後のリダイレクト先は正しいか' do
      expect(page).to have_current_path todolist_path(List.last)
    end
  end
  
end

describe '一覧画面のテスト' do
  before do
    visit todolist_path
  end
  
  context '一覧の表示とリンクの確認' do
    it '一覧表示画面に投稿されたもの表示されているか' do
      expect(page).to have_link"",href:todolista_path
    end
  end
  
end

describe '詳細画面のテスト' do
  
  before do
    visit todolista_path
  end
  
  context '表示のテスト' do
    it '削除リンクが存在しているか' do
      expect(page).to have_link"",href:destroy_todolist_path
    end
    it '編集リンクが存在しているか' do
      expect(page).to have_link"",href:edit_todolist_path
    end
  end
  
  context 'リンク先の遷移先の確認' do
    it '編集の遷移先は編集画面か' do
      expect(page).to have_current_path edit_todolist_path(List.last)
    end
    it 'listの削除' do
      expect {list.destroy}.to change{List.count}.by(-1)
    end
  end
  
end

describe '編集画面のテスト' do
  before do
    visit edit_todolist_path
  end
  
  context '表示の確認' do
    it '編集前のタイトルと本文がフォームに表示（セット）されている' do
      expect(page).to have_field 'list[title]', with:'hoge'
      expect(page).to have_field 'list[body]', with:'body'
    end
    
    it '保存ボタンが表示される' do
      expect(page).to have_button '保存'
    end
  end
  
  context '更新処理に関するテスト'do
    it '更新後のリダイレクト先は正しいか' do
      expect(page).to have_current_path todolist_path(List.last)
    end
  end
end
  