class SubjectsController < ApplicationController
  layout "admin"
  # index and show are from the READ part of CRUD
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end
  

  # new and create are from the CREATE part of CRUD
  def new
    @subject = Subject.new({:name =>"Default"})
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save 
      flash[:notice] = "Subject '#{@subject.name}' successfully created."
      redirect_to :action=> 'index'
    else
      @subject_count = Subject.count + 1
      render 'new'
    end
  end

  # edit and update are from of the UPDATE part of CRUD
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    #Find the subject to edit
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject '#{@subject.name}' successfully updated."
      # If the update succeeds redirect to show
      redirect_to :action => 'show', :id=> @subject.id
    else
      # If update fails, redisplay the form so user can fix problems
      @subject_count = Subject.count
      render 'edit'
    end
  end

  # delete and destroy are from the DELETE part of CRUD
  # in this example both delete and destroy actions were used
  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' successfully destroyed."
    redirect_to :action=> 'index'
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
