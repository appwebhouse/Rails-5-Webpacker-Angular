require 'spec_helper'

describe 'ApplicationHelper', type: :helper do
  describe '#navlink' do
    let(:link) do
      nav_link root_path do
        'Link'
      end
    end

    context 'when the given path is the current path' do
      before { allow(self).to receive(:current_page?).and_return(true) }

      it 'should return a li with the `nav-item` class' do
        expect(link).to have_tag('li', with: { class: 'nav-item' })
      end

      it 'should return a link with the `nav-link active` class' do
        expect(link).to have_tag('a', with: { class: 'nav-link active' })
      end
    end
  end
end
