package com.team.app.service;

import java.util.Map;

public interface OrganisationService {

	Map<String, Object> getLoraServerOrganisation() throws Exception;

	long getLoraServerUsers()throws Exception;

}
