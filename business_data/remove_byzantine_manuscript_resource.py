import json

new_business_data = {
    "business_data": {
        "resources":[]
    }
}

with open("DISCO Project_2017-04-14_18-24-49.json","rb") as o:
    d = json.load(o)
    resources = d['business_data']['resources']
    
    for resource in resources:
        skip = False
        for tile in resource['tiles']:
            data = tile['data']
            if data:
                # print data.values()
                if "Byzantine Manuscripts" in data.values():
                    skip = True
        if skip:
            continue
        print "adding good resource"
        new_business_data['business_data']['resources'].append(resource)
print new_business_data
with open("DISCO Project_2017-04-14_18-24-49_nobyzantinemanuscripts.json","w") as out:
    json.dump(new_business_data,out,indent=2)
    