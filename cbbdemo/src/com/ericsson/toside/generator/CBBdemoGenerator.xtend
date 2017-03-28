/*
 * generated by Xtext 2.12.0-SNAPSHOT
 */
package com.ericsson.toside.generator

import com.ericsson.toside.cbbdemo.CbbdemoFactory
import com.ericsson.toside.cbbdemo.Goodbye
import com.ericsson.toside.cbbdemo.Greeting
import com.ericsson.toside.cbbdemo.Program
import com.google.inject.Inject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.eclipse.xtext.generator.trace.node.Traced
import org.eclipse.xtext.generator.trace.node.TracedAccessors
import org.eclipse.emf.common.util.URI

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class CBBdemoGenerator extends AbstractGenerator {
	
	@TracedAccessors(CbbdemoFactory)
	static class CBBdemoTraceExtensions {
	}

	@Inject extension CBBdemoTraceExtensions
	
	var URI sourceURI = null

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		val program = resource.contents.head as Program
		sourceURI = resource.URI
		var outputFilename = sourceURI.lastSegment.replace('.hello', '.c')
		
		fsa.generateTracedFile (outputFilename, program, '''
			#include <stdio.h>
			
			int main ()
			{
			  «FOR s : program.statements »
			    « s.generate »
			  «ENDFOR»

			  return 0;
			}
		''')
	}
	
	@Traced dispatch def String generate(Greeting g) {
		val line = println(g.location.lineNumber)
		'''
		{
		  const char *name = "«g._name»";
		  printf("Saying hello to %s\n", name);
		}
		'''
	}
	
	@Traced dispatch def String generate(Goodbye g) {
		val line = println(g.location.lineNumber)
		'''
		{
		  const char *name = "«g._name»";
		  printf("Saying goodbye to %s\n", name);
		}
		'''
	}
}
