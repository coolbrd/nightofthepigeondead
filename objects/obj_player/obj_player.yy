{
    "id": "8bcc61f8-700b-440e-b5c7-e2b6bb06a72d",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "obj_player",
    "eventList": [
        {
            "id": "1fdc435b-23f3-4680-b7ec-feb1877ef7a4",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "8bcc61f8-700b-440e-b5c7-e2b6bb06a72d"
        },
        {
            "id": "4f030e19-723d-4fec-963f-bc27d035041a",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "8bcc61f8-700b-440e-b5c7-e2b6bb06a72d"
        },
        {
            "id": "6b69a88b-0e22-4f40-9b54-331e2a329420",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 64,
            "eventtype": 8,
            "m_owner": "8bcc61f8-700b-440e-b5c7-e2b6bb06a72d"
        },
        {
            "id": "8a10ab6d-4dd1-42f6-883b-b26f671f6963",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 8,
            "m_owner": "8bcc61f8-700b-440e-b5c7-e2b6bb06a72d"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": [
        {
            "id": "9d0ff5b4-9814-41a7-868b-5c7138c9f862",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "5520c88c-3b68-40f4-9408-985806d68159",
            "propertyId": "f4d6158f-1e3f-4624-a4a7-82096908f989",
            "value": "obj_solid"
        }
    ],
    "parentObjectId": "5520c88c-3b68-40f4-9408-985806d68159",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "052ceb02-42bb-46c8-a9c5-8f65cca5da03",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2",
            "varName": "walk_speed",
            "varType": 0
        },
        {
            "id": "dd5ee83c-d913-4648-9874-786993dc834c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "obj_swing",
            "varName": "swing",
            "varType": 5
        },
        {
            "id": "2ef034df-d4f3-439a-8923-445d624c18a0",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "30",
            "varName": "swing_cooldown",
            "varType": 1
        },
        {
            "id": "cf86613b-8347-42ef-bfc7-734ea8bc1ca1",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "15",
            "varName": "swing_duration",
            "varType": 1
        },
        {
            "id": "87034dcc-43a2-423c-b34c-95d5e27679fe",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "30",
            "varName": "cleaning_duration",
            "varType": 1
        },
        {
            "id": "6a72e691-3697-4147-b029-d4ff51a5c157",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "100",
            "varName": "max_annoyance",
            "varType": 1
        },
        {
            "id": "ba8e2e31-35fa-4f8c-abe5-87f4907cd8cf",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.02",
            "varName": "per_poop_annoyance",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "8a90fc13-44cd-4dc4-88e2-15772bcc953c",
    "visible": true
}