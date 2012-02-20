steps_for :table_list do
  step "I look around" do
    @monsters_seen = @monsters.keys
  end

  step "I should see these monsters:" do |table|
    table.to_list.should == @monsters_seen
  end
end
