if @markups
  json.success "true"
  json.message "Location Saved"
  json.data do
    json.markers @markups
  end
else
  json.success "false"
  json.message "Location Didn't Save"
  json.data do
  end
end