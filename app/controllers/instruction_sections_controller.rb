class InstructionSectionsController < ApplicationController
  before_action :set_instruction_section, only: %i[ show edit update destroy ]

  # GET /instruction_sections or /instruction_sections.json
  def index
    @instruction_sections = InstructionSection.all
  end

  # GET /instruction_sections/1 or /instruction_sections/1.json
  def show
  end

  # GET /instruction_sections/new
  def new
    @instruction_section = InstructionSection.new
  end

  # GET /instruction_sections/1/edit
  def edit
  end

  # POST /instruction_sections or /instruction_sections.json
  def create
    @instruction_section = InstructionSection.new(instruction_section_params)

    respond_to do |format|
      if @instruction_section.save
        format.html { redirect_to instruction_section_url(@instruction_section), notice: "Instruction section was successfully created." }
        format.json { render :show, status: :created, location: @instruction_section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instruction_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instruction_sections/1 or /instruction_sections/1.json
  def update
    respond_to do |format|
      if @instruction_section.update(instruction_section_params)
        format.html { redirect_to instruction_section_url(@instruction_section), notice: "Instruction section was successfully updated." }
        format.json { render :show, status: :ok, location: @instruction_section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instruction_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instruction_sections/1 or /instruction_sections/1.json
  def destroy
    @instruction_section.destroy!

    respond_to do |format|
      format.html { redirect_to instruction_sections_url, notice: "Instruction section was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction_section
      @instruction_section = InstructionSection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instruction_section_params
      params.fetch(:instruction_section, {})
    end
end
