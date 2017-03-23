/*
 * generated by Xtext 2.12.0-SNAPSHOT
 */
package com.ericsson.toside.ui;

import cbbdemo.ui.internal.CbbdemoActivator;
import com.google.inject.Injector;
import org.eclipse.xtext.ui.guice.AbstractGuiceAwareExecutableExtensionFactory;
import org.osgi.framework.Bundle;

/**
 * This class was generated. Customizations should only happen in a newly
 * introduced subclass. 
 */
public class CBBdemoExecutableExtensionFactory extends AbstractGuiceAwareExecutableExtensionFactory {

	@Override
	protected Bundle getBundle() {
		return CbbdemoActivator.getInstance().getBundle();
	}
	
	@Override
	protected Injector getInjector() {
		return CbbdemoActivator.getInstance().getInjector(CbbdemoActivator.COM_ERICSSON_TOSIDE_CBBDEMO);
	}
	
}