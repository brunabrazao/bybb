require 'rails_helper'

RSpec.describe 'homepage/index' do
  let(:featurette_props) do
    double(:featurette_props,
           featurette_item_class: 'class',
           header: 'header',
           sub_header: 'sub-header',
           copy: 'copy',
           img: '')
  end

  let(:presenter) do
    instance_double('HomepagePresenter', :presenter,
                    carousel_props: [],
                    featurette_props: [
                      featurette_props
                    ])
  end

  before do
    allow(HomepagePresenter).to receive(:new).and_return(presenter)
    allow(presenter).to receive(:carousel_props).and_return([])
    allow(presenter).to receive(:featurette_props).and_return([featurette_props])
    assign(:presenter, presenter)

    stub_template 'views/homepage/_carousel.html.erb' => 'carousel'
    stub_template 'views/homepage/_featurette.html.erb' => 'featurette'
  end

  it 'renders carousel partial' do
    render
    expect(response).to render_template(partial: 'carousel', locals: { presenter: presenter })
  end

  it 'renders featurette partial' do
    render
    expect(response).to render_template(partial: 'featurette',
                                        locals: { featurette_item_class: 'class', header: 'header',
                                                  sub_header: 'sub-header', copy: 'copy', img: '' })
  end
end
