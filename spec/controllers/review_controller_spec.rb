require "rails_helper"

describe ReviewsController do
  let(:business) { Fabricate(:business) }
  let(:user) { Fabricate(:user) }

  context "GET new" do
    context "without valid credentials" do
      it "redirects to the sign_in path" do
        get :new, business_id: business.id
        expect(response).to redirect_to sign_in_path
      end
    end

    context "with valid credentials" do
      it "renders the new form" do
        session[:user_id] = user.id
        get :new, business_id: business.id
        expect(response).to render_template :new
      end
    end
  end

  context "POST create" do
    context "POST create" do
      context "without valid credentials" do
        it "redirects to the sign_in_path" do
          post :create, business_id: business.id
          expect(response).to redirect_to sign_in_path
        end
      end

      context "with valid credentials" do
        before do
          session[:user_id] = user.id
        end

        context "with valid inputs" do
          it "displays the show business page" do
            post :create, review: Fabricate.attributes_for(:review), business_id: business.id
            expect(response).to redirect_to business_path(business.id)
          end

          it "creates the review" do
            business = Fabricate(:business)
            post :create, review: Fabricate.attributes_for(:review), business_id: business.id
            expect(Review.count).to eq(1)
          end
        end

        context "without valid inputs" do
          it "re-renders the new page" do
            post :create, review: { rating: 2 }, business_id: business.id
            expect(response).to render_template :new
          end

          it "displays the danger message" do
            post :create, review: { rating: 2 }, business_id: business.id
            expect(flash[:danger]).not_to be_blank
          end

        end
      end
    end 
  end

end
  