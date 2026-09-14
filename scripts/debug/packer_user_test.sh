curl -k -H "Authorization: PVEAPIToken=packer@pve!packer-token=e87f92d4-253f-44b9-95a4-b57dbbfe0f19" \
  https://168.119.3.249:8006/api2/json/version

echo a
curl -k -H "Authorization: PVEAPIToken=packer@pve!packer-token=e87f92d4-253f-44b9-95a4-b57dbbfe0f19" \
  https://168.119.3.249:8006/api2/json/access/permissions