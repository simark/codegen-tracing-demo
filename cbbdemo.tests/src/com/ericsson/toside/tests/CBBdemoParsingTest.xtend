/*
 * generated by Xtext 2.12.0-SNAPSHOT
 */
package com.ericsson.toside.tests

import com.ericsson.toside.cbbdemo.Program
import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(CBBdemoInjectorProvider)
class CBBdemoParsingTest {
	@Inject
	ParseHelper<Program> parseHelper
	
	@Test
	def void loadModel() {
		val result = parseHelper.parse('''
			Hello Xtext!
		''')
		Assert.assertNotNull(result)
		Assert.assertTrue(result.eResource.errors.isEmpty)
	}
}
