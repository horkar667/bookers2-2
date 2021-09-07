class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', "#{content}%")
      elsif method == 'rear'
        User.where('name LIKE ?', "%#{content}")
      elsif method == 'partial'
        User.where('name LIKE ?', "%#{content}%")
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(body: content)
      elsif method == 'forward'
        Book.where('body LIKE ?', "#{content}%")
      elsif method == 'rear'
        Book.where('body LIKE ?', "%#{content}")
      elsif method == 'partial'
        Book.where('body LIKE ?', "%#{content}%")
      end
    end
  end
end
