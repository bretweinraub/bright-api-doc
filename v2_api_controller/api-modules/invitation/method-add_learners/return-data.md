
If api_template request parameter isn't set to extended, the API will respond with the invitation document:

    {
      "id": 103,
      "license": true,
      "avoid_duplicate_registrations": false,
      "custom": "{\"license\":true,\"order_id\":10592,\"course_guids\":[\"0215JCHCMscorm12.3cdd5a65-0ec2-44a-c5a1f-37d9283757ce\"],\"license_data\":{\"2051JCHMCscorm1.23cdd56a-5e0c2-44ac-a51f-739d283757ce\":{\"seats_available\":5}},\"initiating_site\":\"localhost\",\"initiating_user\":\"support@aura-software.com\"}",
      "description": null,
      "enabled": true,
      "learners": [
        "support@aura-software.com"
      ],
      "name": "this73807a",
      "no_updates_allowed": false,
      "course_guids": [
        "2c3dd5a65-0ec2-44ac-a51f-37d9283757ce"
      ],
      "registration_guids": [
        "895-XWv_74NgkYTl03_zXIqXwg",
        "895-DY11XFd4ooLiJeGcx7HE3w"
      ],
      "realm_id": 1
    }

When api_template is set to extended, the response looks like:

    {
      "record": {
        "id": 103,
        "created_at": "2015-11-25T16:40:27.914Z",
        "updated_at": "2015-11-25T16:40:27.914Z",
        "realm_id": 10,
        "name": "this73807a",
        "description": null,
        "enabled": true,
        "custom": "{\"license\":true,\"order_id\":10592,\"course_guids\":[\"2c3dd5a65-0ec2-44ac-a51f-37d9283757ce\"],\"license_data\":{\"2c3dd5a65-0ec2-44ac-a51f-37d9283757ce\":{\"seats_available\":5}},\"initiating_site\":\"localhost\",\"initiating_user\":\"support@aura-software.com\"}",
        "avoid_duplicate_registrations": false,
        "no_updates_allowed": false,
        "invitation_template_id": null,
        "license": true,
        "course_guids": [
          "2c3dd5a65-0ec2-44ac-a51f-37d9283757ce"
        ],
        "learners": [
          "support@aura-software.com"
        ]
      },
      "registration_guids": {
        "support@aura-software.com": {
          "2c3dd5a65-0ec2-44ac-a51f-37d9283757ce": {
            "title": "My Course",
            "registration_guid": "895-XWv_74NgkYTl03_zXIqXwg"
          }
        }
      },
      "messages": [
        "Success!  Found and reused existing registration (895-XWv_74NgkYTl03_zXIqXwg) for support@aura-software.com on 'My Course' as part of license 'this73807a'."
      ]
    }
