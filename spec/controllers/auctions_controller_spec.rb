require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  describe "#new" do
      it "renders the new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "instantiates a new auction object and set it to @auction" do
        get :new
        expect(assigns(:auction)).to be_a_new(Auction)
      end
    end

  describe "#create" do

      context "with valid attributes" do
        def valid_request
          post :create, auction:{
            title: "me",
            details: "i'm broken",
            ends_on: 10.days.from_now,
            reserve_price: 250,
          }
        end

        it "creates a record in the database" do
          auction_count_before = Auction.count
          valid_request
          auction_count_after = Auction.count
          expect(auction_count_after - auction_count_before).to eq(1)
        end

      end

      context "with invalid attributes" do

        def invalid_request
          post :create, auction:{ title: nil,
            details: "gimme the deets",
            ends_on: 10.days.from_now,
            reserve_price: 250,
          }
        end

        it "doesn't create a record in the database" do
          auction_count_before = Auction.count
          invalid_request
          auction_count_after = Auction.count
          expect(auction_count_before).to eq(auction_count_after)
        end
      end
    end

end
