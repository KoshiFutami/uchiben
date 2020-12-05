class VocabsController < ApplicationController
  before_action :find_vocab, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @vocabs = Vocab.all.recent
    # @vocabs = Vocab.all.order(created_at: "DESC")
    
    gon.vocabs = @vocabs
    # gon.vocab = gon.vocabs

    @learning_ranks = Vocab.create_learning_ranks

    @user_ranks = User.create_user_ranks

    @todays_vocabs = Vocab.where(created_at: Time.now.all_day)

    @comment = Comment.new

  end

  def new
    @vocab = current_user.vocabs.new
  end

  def create
    @vocab = current_user.vocabs.new(vocab_params)

    if @vocab.name.match(/[一-龠々]/)
      @vocab.converted_name = @vocab.name.to_kanhira.to_roman
    elsif @vocab.name.is_hira? || @vocab.name.is_kana?
      @vocab.converted_name = @vocab.name.to_roman
    else
      @vocab.converted_name = @vocab.name
    end

    if @vocab.translation.match(/[一-龠々]/)
      @vocab.converted_translation = @vocab.translation.to_kanhira.to_roman
    elsif @vocab.translation.is_hira? || @vocab.translation.is_kana?
      @vocab.converted_translation = @vocab.translation.to_roman
    else
      @vocab.converted_translation = @vocab.translation
    end

    # if @vocab.sentence.match(/[一-龠々]/)
    #   @vocab.converted_sentence = @vocab.sentence.to_kanhira.to_roman
    # elsif @vocab.sentence.is_hira? || @vocab.sentence.is_kana?
    #   @vocab.converted_sentence = @vocab.sentence.to_roman
    # else
    #   @vocab.converted_sentence = @vocab.sentence
    # end


    if @vocab.save
      redirect_to :root
    else
      render :new
    end
  end

  def update

    if @vocab.update(vocab_params)
      if @vocab.name.match(/[一-龠々]/)
        @vocab.converted_name = @vocab.name.to_kanhira.to_roman
      elsif @vocab.name.is_hira? || @vocab.name.is_kana?
        @vocab.converted_name = @vocab.name.to_roman
      else
        @vocab.converted_name = @vocab.name
      end
  
      if @vocab.translation.match(/[一-龠々]/)
        @vocab.converted_translation = @vocab.translation.to_kanhira.to_roman
      elsif @vocab.translation.is_hira? || @vocab.translation.is_kana?
        @vocab.converted_translation = @vocab.translation.to_roman
      else
        @vocab.converted_translation = @vocab.translation
      end
  
      # if @vocab.sentence.match(/[一-龠々]/)
      #   @vocab.converted_sentence = @vocab.sentence.to_kanhira.to_roman
      # elsif @vocab.sentence.is_hira? || @vocab.sentence.is_kana?
      #   @vocab.converted_sentence = @vocab.sentence.to_roman
      # else
      #   @vocab.converted_sentence = @vocab.sentence
      # end

      @vocab.save

      redirect_to vocab_path(@vocab)
    else
      render 'edit'
    end
  end

  def show
    @comment = Comment.new
    @comments = @vocab.comments 
  end

  def destroy
    @vocab.destroy
    redirect_to root_path
  end

  def search
    @vocabs = Vocab.search(params[:search])
  end

  def learnings
    @vocabs = current_user.learning_vocabs.includes(:user)
  end

  def rank 
  end

  private

  def find_vocab
    @vocab = Vocab.find(params[:id])
  end

  def vocab_params
    params.require(:vocab).permit(:name, :translation, :sentence)
  end


end
