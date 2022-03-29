class PostsController < ApplicationController
  before_action :set_post, only: %i[destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def show; end

  def new
    @post = current_user.posts.build
  end

  def edit; end

  def create
    feed_posts = Feed.find_by(organisation_id: current_user.organisation_id).posts
    @post = current_user.posts.build(post_params)

    feed_posts << @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to feed_path(current_organisation.id), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to feed_path(current_organisation.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to feed_path(current_organisation.id), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
