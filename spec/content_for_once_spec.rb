require 'spec_helper'

describe ContentForOnce do
  it 'has a version number' do
    expect(ContentForOnce::VERSION).not_to be nil
  end

  context 'call `content_for_once` in the view' do
    let(:action_view) { ActionView::Base.new { include ContentForOnce::Helpers } }

    let(:first_given_block) { "<link rel='stylesheet' href='example1.css'>".html_safe }
    let(:second_given_block) { "<link rel='stylesheet' href='example1.css'><link rel='stylesheet' href='example2.css'>".html_safe }
    let(:third_given_block) { "<link rel='stylesheet' href='example2.css'><link rel='stylesheet' href='example3.css'>".html_safe }

    let(:expected_tags) { "<link rel='stylesheet' href='example1.css'><link rel='stylesheet' href='example2.css'><link rel='stylesheet' href='example3.css'>" }

    it 'embeds each unique tags only once' do
      action_view.content_for_once :css do
        first_given_block
      end
      action_view.content_for_once :css do
        second_given_block
      end
      action_view.content_for_once :css do
        third_given_block
      end

      expect(action_view.view_flow.content).to be_has_key(:css)
      expect(action_view.view_flow.content[:css]).to eq(expected_tags)
    end
  end
end
