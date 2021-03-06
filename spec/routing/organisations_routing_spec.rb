require 'rails_helper'

RSpec.describe OrganisationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'admin/organisations').to route_to('organisations#index')
    end

    it 'routes to #new' do
      expect(get: 'admin/organisations/new').to route_to('organisations#new')
    end

    it 'routes to #show' do
      expect(get: 'admin/organisations/1').to route_to('organisations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'admin/organisations/1/edit').to route_to('organisations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'admin/organisations').to route_to('organisations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: 'admin/organisations/1').to route_to('organisations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'admin/organisations/1').to route_to('organisations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'admin/organisations/1').to route_to('organisations#destroy', id: '1')
    end
  end
end
