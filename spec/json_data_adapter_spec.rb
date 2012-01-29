require 'spec_helper'
require 'json_data_adapter'

describe JsonDataAdapter do
  it 'should convert json to a ruby object with only selected columns' do
    line = %Q@{ "_id" : { "$oid" : "4f1963c9cf79522550a4a5be" }, "date" : { "$date" : 1327064009959 }, "request_id" : "4903725968590133015", "environment" : "acceptance", "server_ip" : "194.213.22.199", "contract" : "test", "product" : "HOTEL", "country_code" : "ES", "city_code" : [ "PMI" ], "date_from" : { "$date" : 1338501600000 }, "date_to" : { "$date" : 1338760800000 }, "method" : "hotels", "facility" : "resfinity.api", "time_taken" : 22678, "partial_time_taken" : [ { "facility" : "anixe.Xenia.MasterCodeDataSource", "time_taken" : 38, "count" : 11 }, { "facility" : "anixe.TravelObjects.Engine", "time_taken" : 22547 }, { "facility" : "MasterHotelsBuilder", "time_taken" : 1, "count" : 8 }, { "facility" : "remaining", "time_taken" : 92 } ], "hotel" : { "providers" : [ { "provider" : "TOURICO", "time_taken" : 3238, "currency" : "EUR", "provider_city_code" : [ "PMI" ], "cat4" : { "min_price" : 299.25, "max_price" : 348.51, "no_hotels" : 5 }, "cat5" : { "min_price" : 598.47, "max_price" : 598.47, "no_hotels" : 1 }, "transactions" : { "search_hotels" : { "sent" : 2, "received" : 2 } } }, { "provider" : "KUONI", "time_taken" : 1177, "currency" : "EUR", "provider_city_code" : [ "376" ], "cat4" : { "min_price" : 408, "max_price" : 408, "no_hotels" : 1 }, "cat3" : { "min_price" : 294, "max_price" : 294, "no_hotels" : 1 }, "transactions" : { "availability" : { "sent" : 1, "received" : 1 } } }, { "provider" : "HOTELBEDS", "time_taken" : 3202, "errors" : [ "C01-01-007-FO, You are not allowed to access the system., You are not allowed to access the system.", "0AVL" ], "transactions" : { "availability_request" : { "sent" : 2, "received" : 2 } } }, { "provider" : "GTA", "time_taken" : 3199, "errors" : [ "0AVL" ], "transactions" : { "search_hotel_price_request" : { "sent" : 1, "received" : 1 } } }, { "provider" : "MIKI", "time_taken" : 862, "errors" : [ "3350, We dont have prices for this criteria.  Please choose alternative criteria.", "0AVL" ], "transactions" : { "city_search_request" : { "sent" : 1, "received" : 1 } } }, { "provider" : "VALADIS", "time_taken" : 12103, "errors" : [ "The maximum number of connections has been exceeded", "0AVL" ], "transactions" : { "availability" : { "sent" : 5, "received" : 5 } } }, { "provider" : "JACTRAVEL", "time_taken" : 3604, "errors" : [ "0AVL" ], "transactions" : { "service_search_request" : { "sent" : 2, "received" : 2 } } }, { "provider" : "TRAVCO", "time_taken" : 3878, "errors" : [ "Information ( Your Selection is currently not featured. Please go back and select other items. Error No:HAXSD3029)", "0AVL" ], "transactions" : { "availability" : { "sent" : 1, "received" : 1 } } }, { "provider" : "MASTERHOTELS", "time_taken" : 1985, "transactions" : { "master_hotels" : { "sent" : 1, "received" : 1 } } }, { "provider" : "SIDETOURS", "time_taken" : 12012, "errors" : [ "0AVL" ], "transactions" : { "availability" : { "sent" : 1, "received" : 1 } } }, { "provider" : "OHG", "time_taken" : 22436, "errors" : [ "Timeout occured." ], "transactions" : { "availability_search" : { "sent" : 1, "received" : 0 } } } ] } }@
    row = JsonDataAdapter.convert(line)

    row.keys.should == [:contract, :facility, :method, :product, :timestamp, :time_taken] 

    row[:contract].should == 'test'
    row[:facility].should == 'resfinity.api'
    row[:method].should == 'hotels'
    row[:product].should == "HOTEL"
    row[:timestamp].to_s.should == '2012-01-20 13:53:29 +0100'
    row[:time_taken].should == 22678
  end

end
