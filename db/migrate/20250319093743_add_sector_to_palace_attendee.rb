class AddSectorToPalaceAttendee < ActiveRecord::Migration[7.0]
  def change
    add_column :palace_attendees, :sector, :string
    add_column :palace_attendees, :association_to_commonwealth_countries, :string
    add_column :palace_attendees, :leader_or_volunteer_in_an_initiative, :string
  end
end
