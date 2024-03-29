require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a Ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Body", with: @ticket.body
    fill_in "Email", with: @ticket.email
    fill_in "First name", with: @ticket.first_name
    fill_in "Last name", with: @ticket.last_name
    fill_in "Phone", with: @ticket.phone
    fill_in "Status", with: @ticket.status
    fill_in "Title", with: @ticket.title
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Body", with: @ticket.body
    fill_in "Email", with: @ticket.email
    fill_in "First name", with: @ticket.first_name
    fill_in "Last name", with: @ticket.last_name
    fill_in "Phone", with: @ticket.phone
    fill_in "Status", with: @ticket.status
    fill_in "Title", with: @ticket.title
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
