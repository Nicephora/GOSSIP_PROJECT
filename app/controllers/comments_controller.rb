class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create

    @comment = Comment.new(content: params[:content], user: User.all.sample, gossip_id: params[:gossip_id])

    if @comment.save

      flash[:success] = "Ton commentaire a été ajouté !"

      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:danger] = "Ton commentaire n'est pas valide !"
      render :new
    end
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:gossip_id])
  end


  def update
    @comment = Comment.find(params[:gossip_id])
    gossip_params = params.require(:comment).permit(:content)

    if @comment.update(gossip_params)
      flash[:success] = "Ton commentaire a été modifié !"
      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:danger] = "Ton commentaire n'est pas valide !"
      render :edit
    end
  end


  def destroy
    @comment = Comment.find(params[:gossip_id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip.id)
  end
end
