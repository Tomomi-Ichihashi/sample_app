class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのモデルオプジェクトを生成する
    ＠list = List.new
  end
end
