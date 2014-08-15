json.array!(@creditdetails) do |creditdetail|
  json.extract! creditdetail, :id, :cid, :credit, :intyp, :way, :userid
  json.url creditdetail_url(creditdetail, format: :json)
end
