require 'rails_helper'

describe ApplicationHelper do
  describe "full_title" do
    let(:base_title) {"Coffee diary"}
    subject {full_title(page_title: page_title)}

    context "画面の個別タイトルがない場合" do
      let(:page_title) {""}
      it {is_expected.to eq base_title}
    end
    context "画面の個別タイトルがある場合" do
      let(:page_title) {"title"}
      it {is_expected.to eq "#{page_title} | #{base_title}"}
    end
  end
end
