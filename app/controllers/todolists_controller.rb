class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのモデルオプジェクトを生成する
    ＠list = List.new
  end
  
  # 以下を追加
  def create
    # 1.データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 2.データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 3.トップ画面へリダイレクト
    # redirect_to '/top'を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)
    
  end
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.permit(:title, :body)
  end
    
end
