package com.nic

class Location {

	String name
	String desc
	Location parent

	static constraints = {
		parent nullable: true

	}
}
