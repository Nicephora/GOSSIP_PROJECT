class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end
  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(gossip: @gossip)
  end
  def index
    @gossip_array = Gossip.all

  end
  def create
    @gossip = Gossip.new(content: params[:content], title: params[:title], user: User.all.sample)

    if @gossip.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Ton gossip a été ajouté !"
      redirect_to gossips_path
    else
      flash[:danger] = "Ton gossip n'est pas valide !"
      render new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end


  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(gossip_params)
      flash[:success] = "Ton gossip a été modifié !"
      redirect_to @gossip
    else
      flash[:danger] = "Ton gossip n'est pas valide !"
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
  private
  def gossip_params
     params.require(:gossip).permit(:title, :content)
   end
end
