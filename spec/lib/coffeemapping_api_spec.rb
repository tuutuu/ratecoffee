require 'rails_helper'

describe "CoffeemappingApi" do

  it "when HTTP GET returns multiple entries, they are parsed and returned" do
    canned_answer = <<-END_OF_STRING
{"html_attributions":[],"results":[{"formatted_address":"Annankatu 19, Helsinki, Finland","geometry":{"location":{"lat":60.1664036,"lng":24.9377845},"viewport":{"northeast":{"lat":60.166428,"lng":24.93785445},"southwest":{"lat":60.16633040000001,"lng":24.93757465}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/cafe-71.png","id":"9dcaf8ffb5138256562c127a43828eae7a688971","name":"TeeMaa Teehuone/Tea House","opening_hours":{"exceptional_date":[],"open_now":false,"weekday_text":[]},"photos":[{"height":3024,"html_attributions":["\u003ca href=\\"https://maps.google.com/maps/contrib/104933887211143041723/photos\\"\u003eEkaterina Mariinsky\u003c/a\u003e"],"photo_reference":"CoQBdwAAAItKkFbWKLWJcewOleWje3OU8DmyHDthRG9H6KX1_6uqPOVOcXFoBSdw3OUnUHALgaWh0SwOkVR4zgXK056PTE_JO0u8pFJSOsQaya97isWfCJ2vohkgJe63NWxZNmuv6XQ3wX0CVYgyAa0afb5bslp-o9DFykRmgwqdbU0nMtSCEhBsm2InUelgOlyL8dxx4WxVGhTx7h8n92MEaoZu0ZH60O32QxOIVA","width":4032}],"place_id":"ChIJ-wsepMsLkkYRaCHijbRHJ7M","rating":4.8,"reference":"CmRSAAAA-n9jv_P9pyCcYKxPvoHrazXDVaa7oFeGK344AwUtrSvZevkOXQ7l4H9KXrBpYcozbzEGDaOKhZZiWVnPw10Csuv3IQAC88y304FH4EtTkE-MUmwlOOGtb4Gi6h6nJryaEhAd4SdUGOghGU8bKJcCJMorGhSdhNw3Zp9jwQk_h2OybosaXorv5Q","types":["cafe","food","point_of_interest","establishment"]},{"formatted_address":"Eerikinkatu 10, 00100 Helsinki, Finland","geometry":{"location":{"lat":60.1671774,"lng":24.9355072},"viewport":{"northeast":{"lat":60.16728015,"lng":24.9355589},"southwest":{"lat":60.16714314999999,"lng":24.9353521}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/cafe-71.png","id":"c243bef692a2b8583b104c952cca18fdd488a914","name":"théhuone Eerikinkatu","opening_hours":{"exceptional_date":[],"open_now":false,"weekday_text":[]},"photos":[{"height":1489,"html_attributions":["\u003ca href=\\"https://maps.google.com/maps/contrib/101858820469806331407/photos\\"\u003ethéhuone Eerikinkatu\u003c/a\u003e"],"photo_reference":"CoQBdwAAAE9_UaGihIwOfXMcv4c6uyBT_oOXvcljKHQ8VK6T6cXVOHti9kQBunm7iL65_df2lP05ae3zFDN5fagYyUWajOkUnPHTc9vuCk1boo-mlpyWu7PmnIje_DSF_8Le6I_p41F_JV8IQl-F-3-O9uIdY9JoUOsLrHyTCB37Uk8RbpRXEhDdhLCdrW9IMTVmK-cn9CefGhRrCbn0OhKAEWRZZPlE3zF602W8TA","width":1490}],"place_id":"ChIJm1loFMsLkkYRYC1fV9g801Y","rating":4.8,"reference":"CmRRAAAAsSL7BGSNDsFBXAL0oPHGO6GHsZj9QJhVxNVavCqgRs2YQVdqag4FU6lFtqq5_74OCqeUTrsgxehA9AAVvgILgtSoWpdScgmsto2yLMRdd8Qdlzj-cAzjox_qBINr-kXoEhCmP3FLnsccg_aZcjLR2X_bGhQZIBWwN2tfX8fY0Ik-pzWOLS9_gw","types":["cafe","food","point_of_interest","establishment"]},{"formatted_address":"Annankatu 13, 00120 Helsinki, Finland","geometry":{"location":{"lat":60.16445909999999,"lng":24.9401848},"viewport":{"northeast":{"lat":60.16450605,"lng":24.9403195},"southwest":{"lat":60.16443385,"lng":24.94011230000001}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/cafe-71.png","id":"cc511afd45d660bf10ba59ff8a23af42e1db306c","name":"DEMMERS TEEHAUS","opening_hours":{"exceptional_date":[],"open_now":false,"weekday_text":[]},"photos":[{"height":1071,"html_attributions":["\u003ca href=\\"https://maps.google.com/maps/contrib/112754687047342832757/photos\\"\u003eDEMMERS TEEHAUS\u003c/a\u003e"],"photo_reference":"CoQBdwAAAGF1-F5NJhba-VW_Vr-VLKZ5OgcIwNkX54dcsSrboY1Vabt_fjZUXN9N01kkavlNbIUy8RiPkO5s2H7IO0nwx12yOokCs6nLud4Ld7caW67xdEQ2q6x5u2KhbzPCTehV7jd-pkRsGhNGvmpB_tHh7vRbm9TwmLRrL1TI1Hc9BTudEhDLsRC_EnnpS7vOTAL_1M30GhSEVy1aHeLy2YmfdyGfi3gP6p7ujQ","width":1600}],"place_id":"ChIJ1a1pLcoLkkYRBxLtVvtQvJY","rating":5,"reference":"CmRSAAAAvM6yDFRUQgx45GHTwV33kKtqkrPiqPBpaLxNJuLiMysTFgRi6uoCCUkFGiitApfjAGKCusg33lnDUoIZdHTYL-LmNajJHEP28xUlRyekhtUNzslaNRh439YFuSnsrQbBEhB24khyflEODHNlwzYcV710GhSxJaPm84gLhI5DYH_D71npIS7YiQ","types":["cafe","food","point_of_interest","establishment"]},{"formatted_address":"Kanavaranta 7 C, 00160 Helsinki, Finland","geometry":{"location":{"lat":60.1690064,"lng":24.9603019},"viewport":{"northeast":{"lat":60.16922974999999,"lng":24.96045525},"southwest":{"lat":60.16893195,"lng":24.95984184999999}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/cafe-71.png","id":"c0246bb6e31f24a5925b0b8f997104591138cb38","name":"Johan & Nyström","opening_hours":{"exceptional_date":[],"open_now":false,"weekday_text":[]},"photos":[{"height":560,"html_attributions":["\u003ca href=\\"https://maps.google.com/maps/contrib/115076861954284504726/photos\\"\u003eAnton Volkov\u003c/a\u003e"],"photo_reference":"CoQBdwAAAA7nDZTavKiBlf9xE0y70A3M5GKJmQLChn6JewLqjI6E_QjBoA2Iv0FhfEdY50ep8s9kU2UkFNgdwwlZJw8neABNYJ0okYu3ea0nhVTIta9IHjgkBgMc8dbb8s5Ll_7bT-fyOfg2nSGG9ScEQP7fIKQqR-86iOD96Qe5IsawdvnIEhD-4h4u6b5xDrq9sNRPaYDLGhSRD7Hp7sAFmAfQP-o1t9MFgj_5tQ","width":840}],"place_id":"ChIJp6l1RMULkkYRrREse58nppg","rating":4.7,"reference":"CmRSAAAA4m9N9XqHWtVNaIF-K69818IHWmPpot5g4kgTWqbk93CGZEQ0JNbOiL4BBecUcRFRQj5eWR0-SntxADz11ZNwMpd2d5Rtam9B5t1fGh5lkzmt-wMLUpqM4RqLS-OnuIAJEhBRfeVt4nmmwcXDam9yBkc3GhQMLdbWl3SWyQDslus3V4I6PPaXHw","types":["cafe","food","store","point_of_interest","establishment"]},{"formatted_address":"Aleksanterinkatu 9, 00100 Helsinki, Finland","geometry":{"location":{"lat":60.1697542,"lng":24.9481225},"viewport":{"northeast":{"lat":60.17014860000001,"lng":24.94847905},"southwest":{"lat":60.16857099999999,"lng":24.94800365}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/shopping-71.png","id":"de0ef56a3a79d9dbf71552bed0e22e7c8977784c","name":"Chaya Teekauppa","opening_hours":{"exceptional_date":[],"open_now":false,"weekday_text":[]},"place_id":"ChIJn1qrj84LkkYRKyGZemfmY14","rating":5,"reference":"CmRRAAAA-QUkrFtCZqL50nJU_WGIroAI_4ftD72aEm487tD-N-JnO3ExczXIA4urY1WCzjW4qZpbZlp1O8_2qBegqBKCF8l5Gv-OjeX-myuge3BGSdJwgJM3qrwteEzyZT2-YLLAEhCSY-CutGAkSO88pub7_3pqGhSvGUk6yefiuhHqbnIOpVCYfJiqUA","types":["grocery_or_supermarket","food","store","point_of_interest","establishment"]},{"formatted_address":"Iso Roobertinkatu 17, 00120 Helsinki, Finland","geometry":{"location":{"lat":60.1632298,"lng":24.9410516},"viewport":{"northeast":{"lat":60.16326425,"lng":24.9411992},"southwest":{"lat":60.16312644999999,"lng":24.9410024}}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/cafe-71.png","id":"af5cd3ed5af6fb24dba3a10f6695d11c846e166f","name":"The Ounce - Iso Roobertinkatu","opening_hours":{"exceptional_date":[],"open_now":false,"weekday_text":[]},"place_id":"ChIJJZyZkskLkkYRkOGE3pNnQEI","reference":"CmRRAAAAH8Tcs3uN8M3fR0yNfX-KM6tAFgI2on2rtRjBtJMdR6Bsjv4oRQc5I37ebtzg6c5C0yoMl6QXlZOYu_6FsLo1Cbn1RiAtJRp5y3yHeGS2b3xuQuvs-YXruYi5yXgCcsxFEhD4AVgI49zeVST8ewmKnSlcGhSBDkEjZ08YgDu6EDqI5Ld6Uf9xcA","types":["cafe","food","point_of_interest","establishment"]},{"formatted_address":"Pl 12, 00771 Helsinki, Finland","geometry":{"location":{"lat":60.2650306,"lng":25.0727535}},"icon":"https://maps.gstatic.com/mapfiles/place_api/icons/cafe-71.png","id":"0d8a4e5119c0fc808a439a549cc9c86254b81179","name":"Green Tea Finland Oy Ltd","place_id":"ChIJL0pJqiYGkkYR5Um7TtBo9Jg","reference":"CmRSAAAAulWB8jyzVC_yMt1TNGTsBuq0K_j0Vrb_ysm99l6ZUSellHRDTqrISq4bMXQkCKEGo_PPMfqnZjbdqSvsCx9YHKWjdBg6_DuPkeWZCzl4OhmeTymUs36BLWieCzYO-Jn8EhD02us94_mYmsLtva-vAnv1GhRJNwlaUDQlAz86Q1PuFJOYsGQcJg","types":["cafe","food","point_of_interest","establishment"]}],"status":"OK"}
    END_OF_STRING

    stub_request(:get, /.*helsinki/).to_return(body: canned_answer, headers: { 'Content-Type' => "application/json" })

    places = CoffeemappingApi.places_in("helsinki")

    expect(places.size).to eq 7
    place = places[3]
    expect(place.name).to eq("Johan & Nyström")
    expect(place.formatted_address).to eq ("Kanavaranta 7 C, 00160 Helsinki, Finland")
  end

  it "when HTTP GET returns no entries, an empty array is returned" do
    canned_answer = <<-END_OF_STRING
{"html_attributions":[],"results":[],"status":"ZERO_RESULTS"}
    END_OF_STRING

    stub_request(:get, /.*tuure/).to_return(body: canned_answer, headers: { 'Content-Type' => "application/json" })

    places = CoffeemappingApi.places_in("tuure")

    expect(places).to eq []
  end

end