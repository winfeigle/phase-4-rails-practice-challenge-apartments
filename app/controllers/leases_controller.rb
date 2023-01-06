class LeasesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        new_lease = Lease.create!(lease_params)
        render json: new_lease, status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy()
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Lease not found" }, status: :not_found
    end
end
