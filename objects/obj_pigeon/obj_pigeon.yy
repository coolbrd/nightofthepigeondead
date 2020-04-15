{
    "id": "bf26a1ad-9c09-440a-87f2-38561909ad1d",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "obj_pigeon",
    "eventList": [
        {
            "id": "39f16af2-182b-45af-96f4-a494ce79ed36",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "bf26a1ad-9c09-440a-87f2-38561909ad1d"
        },
        {
            "id": "e46f301e-09d3-4c05-92f7-8a70e4fb13f1",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "bf26a1ad-9c09-440a-87f2-38561909ad1d"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
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
            "id": "49e431fb-77ed-47e2-91ff-0b08e1ce288c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "fly_speed",
            "varType": 0
        },
        {
            "id": "907b77da-5f7a-491e-beaa-6bc4a4bd3867",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "flying_direction",
            "varType": 1
        },
        {
            "id": "99a7458e-17ba-4edb-a1ae-df6fcfc78560",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2",
            "varName": "rise_speed",
            "varType": 0
        },
        {
            "id": "6f8342fd-a574-485a-b91f-2b772f11a045",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "30",
            "varName": "turnaround_min",
            "varType": 1
        },
        {
            "id": "f428c852-2431-45a7-b84b-051731f9f9de",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "180",
            "varName": "turnaround_max",
            "varType": 1
        },
        {
            "id": "31148d36-6719-4f85-9c41-83fcfd299ad0",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "240",
            "varName": "poop_interval",
            "varType": 1
        },
        {
            "id": "a78bc69b-af98-44db-9541-c4e7d61ee9dd",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "dive_speed",
            "varType": 0
        },
        {
            "id": "e2bd8334-3670-461c-bb51-086c9574c030",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "360",
            "varName": "dive_delay_min",
            "varType": 1
        },
        {
            "id": "4b16d342-c62b-4f3c-8740-7afeebc98423",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "720",
            "varName": "dive_delay_max",
            "varType": 1
        },
        {
            "id": "b4df102f-1f60-43a3-a955-f202b915916b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "15",
            "varName": "annoyance_per_dive",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "14bde008-7155-4239-a824-32c0618e1867",
    "visible": true
}