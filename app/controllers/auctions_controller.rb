class AuctionsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :new]

  def index
    # @auctions = Auction.where(published: true)
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
    @bids = @auction.bids
  end

  def update
    @auction = Auction.find params[:id]
    if @auction.update auction_params
      redirect_to auction_path(@auction)
    end

    if @auction.publish!
      redirect_to @auction, notice: "Auction is published"
     else
       redirect_to @auction, notice: "Coudln't publish Auction"
     end


  end

  private

  def auction_params
    auction_params = params.require(:auction).permit(:title, :details, :ends_on, :reserve_price, :published)
  end

end
