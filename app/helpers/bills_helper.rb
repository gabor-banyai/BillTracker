module BillsHelper
  def sort_link(column:, label:)
    link_to(label, list_bills_path(column: column))
  end
end
