class TimeEntriesController < ApplicationController

	def update
		# input: project_id, time_entry_id
		# find resources needed
		@project = Project.find(params[:project_id])
		@time_entry = @project.time_entries.find(params[:id])
		if @time_entry.update(time_entry_params)
			redirect_to project_time_entries_path(@project)
		else
			render 'edit'
		end
	end

	def create 
		@project = Project.find(params[:project_id])
		time_entry_params = params.require(:time_entry).permit(
				:hours, :minutes, :date
			)
		@time_entry = @project.time_entries.new(time_entry_params)
		if @time_entry.save
			redirect_to project_time_entries_path(@project)
		else
			render 'new'
		end
	end

	def index
		@project = Project.find(params[:project_id])
		@time_entries = @project.time_entries
	end

	def new
		@project = Project.find(params[:project_id])
		@time_entry = @project.time_entries.new
	end

	def edit 
		@project = Project.find(params[:project_id])
		@time_entry = @project.time_entries.find(params[:id])
	end

	def destroy
		flash[:hello] = "World"
		# find time entry
		@project = Project.find(params[:project_id])
		@time_entry = @project.time_entries.find(params[:id])

		@time_entry.destroy
		redirect_to project_time_entries_path(@project)
	end

	private

	def time_entry_params
		params.require(:time_entry).permit(
				:hours, :minutes, :date, :comment
			)
	end

end
