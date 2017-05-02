require "rails_helper"

describe BusinessesController do
  
  describe "GET index" do
    let(:business1) { Fabricate(:business) }
    let(:business2) { Fabricate(:business) }

    it "returns a list of businesses ordered by average rating" do
      Fabricate(:review, user_id: 1, business: business1, rating: 1)
      Fabricate(:review, user_id: 1, business: business2, rating: 5)
      get :index
      expect(assigns(:businesses)).to eq([business2, business1])
    end  
    
    it "renders the home page" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    it "returns a specific business" do
      business = Fabricate(:business)
      get :show, id: business.id
      expect(assigns(:business)).to eq(business)
    end

    it "shows the business template" do
      business = Fabricate(:business)
      get :show, id: business.id
      expect(response).to render_template :show
    end
  end

  describe "GET new" do
    context "with autenticated user"
      it "displays the new business form" do
        user = Fabricate(:user)
        session[:user_id] = user.id
        get :new
        expect(response).to render_template :new
      end
    context "without authenticated user" do
      it "redirects to the sign_in page" do
        get :new
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe "POST create" do
    context "with autenticated user" do
      let(:user) { Fabricate(:user)}
      before do
        session[:user_id] = user.id
      end

      context "with valid inputs" do
        it "re-renders the show page" do
          post :create, business: Fabricate.attributes_for(:business)
          expect(response).to render_template :show
        end

        it "creates a new business" do
          post :create, business: Fabricate.attributes_for(:business)
          expect(Business.count).to eq(1)
        end
      end

      context "with invalid inputs" do
        it "re-renders the new form" do
          post :create, business: {name: "Bob's Tacos"}
          expect(response).to render_template :new
        end
        it "throws off an error message" do
          post :create, business: {name: "Bob's Tacos"}
          expect(flash[:danger]).not_to be_blank
        end
      end
    end

    context "without authenticated user" do
      it "redirects to the sign_in page" do
        get :create
        expect(response).to redirect_to sign_in_path
      end
    end
  end

end
