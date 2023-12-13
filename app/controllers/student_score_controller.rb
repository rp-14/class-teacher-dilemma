class StudentScoreController < ApplicationController
  before_action :set_student_score, only: %i[show edit update destroy]

  def index
    @student_score = StudentScore.all
  end

  def show
  end

  def new
    @student_score = StudentScore.new
  end

  def create
    @student_score = StudentScore.new(student_score_params)
    if @student_score.save
      redirect_to student_score_path, notice: 'Student score was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @student_score.update(student_score_params)
      redirect_to student_score_path, notice: 'Student score was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student_score.destroy
    redirect_to student_score_path, notice: 'Student score was successfully destroyed.'
  end

  private

  def set_student_score
    @student_score = StudentScore.find(params[:id])
  end

  def student_score_params
    params.require(:student_score).permit(:student_id, :subject1, :subject2, :subject3, :subject4)
  end
end
