package com.oa.manager.impl;

import com.oa.PagerModel;
import com.oa.manager.PersonManager;
import com.oa.model.Organization;
import com.oa.model.Person;

public class PersonManagerImpl extends AbstractPagerManager<Person> implements
		PersonManager {

	public void addPerson(Person person, int orgId) {

		if(orgId == 0){
			throw new RuntimeException("institution not allow empty");
		}
		
		person.setOrg(
				(Organization)getHibernateTemplate().get(Organization.class, orgId)
			);
		getHibernateTemplate().save(person);
	}

	public void deletePerson(int personId) {
		getHibernateTemplate().delete(
				getHibernateTemplate().get(Person.class, personId)
			);
	}

	public Person findPerson(int personId) {
		return (Person)getHibernateTemplate().get(Person.class, personId);
	}

	public PagerModel<Person> searchPersons() {
		return searchPaginated("from Person");
	}

	public PagerModel<Person> searchPersons(int orgId) {
		return searchPaginated("select p from Person p where p.org.id = "+orgId);
	}

}
