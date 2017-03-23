/*
 * generated by Xtext 2.12.0-SNAPSHOT
 */
package com.ericsson.toside.ide

import com.ericsson.toside.CBBdemoRuntimeModule
import com.ericsson.toside.CBBdemoStandaloneSetup
import com.google.inject.Guice
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages as language servers.
 */
class CBBdemoIdeSetup extends CBBdemoStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new CBBdemoRuntimeModule, new CBBdemoIdeModule))
	}
	
}