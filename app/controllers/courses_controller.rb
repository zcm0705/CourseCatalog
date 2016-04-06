class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
  end

  def search
    @subjects = Subject.all.map {|s| [s.name, s.id]}
    # @subjects = [["any", 0]] + @subjects
    @course = nil
  end

  def do_search
    cour_parm = params[:cour]
    subject_parm = params[:subject]

    @courses = search_with_subject(cour_parm, subject_parm)

    respond_to do |format|
      format.js
    end
  end

  def course_params
    params.require(:course).permit(:description, :name, :code)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    course_params = params.require(:course).permit(:name, :description, :code)
    @course = Course.new(course_params)
    if @course.save
        redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: 'new'
    end
    # @course = Course.new(course_params)
    #
    # respond_to do |format|
    #   if @course.save
    #     format.html { redirect_to @course, notice: 'Course was successfully created.' }
    #     format.json { render :show, status: :created, location: @course }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @course.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.fetch(:course, {})
    end

    def search_with_subject(course_name, subject_id)
        courses = Course.all
        results = courses.search(course_name).order("created_at DESC")

      if subject_id && subject_id != ""
        selected_subject_id = Subject.find(subject_id).sub_id
        collection = Array.new
        results.each do |result|
          array = eval(result["subjects"])
          array.each do |pair|
            if pair["id"] == selected_subject_id
              collection << result
            end
          end
        end
        results = collection
      end
      return results
    end
end
