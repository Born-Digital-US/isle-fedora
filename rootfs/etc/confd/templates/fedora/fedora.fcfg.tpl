<?xml version="1.0" encoding="UTF-8"?>

<!--

WARNING! ACHTUNG! ATTENZIONE!

This configuration file is considered a legacy service and will eventually be deprecated.
The recommended means of configuration is now Fedora's Spring configuration facility, as
documented here:

https://wiki.duraspace.org/display/FEDORA36/Spring+Configuration

and here:

https://wiki.duraspace.org/display/FEDORA36/Spring+Security

-->


<server xmlns="http://www.fedora.info/definitions/1/0/config/" class="org.fcrepo.server.BasicServer">
  <param name="adminEmailList" value="bob@example.org sally@example.org">
    <comment>Defines one or more email addresses for server administrators; 
		list is space delimited.</comment>
  </param>
  <param name="datastreamExtensionMappingRels" value="never">
    <comment>Controls filename extension mapping when RELS-INT is used
		as the source of the filename.  Values are as above.</comment>
  </param>
  <param name="datastreamExtensionMappingSource" value="mime-to-extensions.xml">
    <comment>Source of mappings from MIMETYPE to file extension</comment>
  </param>
  <param name="datastreamExpirationLimit" value="300">
    <comment>Controls the size of the datastream mediation hash by removing 
		entries outside the specified threshold. The value is specified in 
		seconds. Note this value must be greater than the limit specified for 
		the datastreamMediationLimit.</comment>
  </param>
  <param name="datastreamMediationLimit" value="5000">
    <comment>Determines the time interval in which external mechanisms must 
		respond to requests by the Fedora server. The value is specified in 
		milliseconds. The value specified should be set high enough to allow 
		for an average response time from any single external mechanisms. Note 
		this value must be less than the limit specified for the 
		datastreamExpirationLimit.</comment>
  </param>
  <param name="httpClientFollowRedirects" value="true">
    <comment>Should the Fedora http client follow redirects?</comment>
  </param>
  <param name="httpClientMaxFollowRedirects" value="3">
    <comment>Maximun number of redirects the Fedora http client will follow (only if 
		httpClientFollowRedirects is set to true.)</comment>
  </param>
  <param name="fedoraServerPort" value="8080">
    <comment>Defines the port number on which the Fedora server runs; 
		default is 8080.</comment>
  </param>
  <param name="fedoraShutdownPort" value="8005">
    <comment>Defines the port number used to shutdown the Fedora sever; 
		default is 8005.</comment>
  </param>
  <param name="httpClientMaxTotalConnections" value="5">
    <comment>Maximum number of total Fedora http client connections allowed at once.</comment>
  </param>
  <param name="httpClientTimeoutSecs" value="20">
    <comment>Number of seconds Fedora http client will wait for a connection before timing 
		out.</comment>
  </param>
  <param name="httpClientSocketTimeoutSecs" value="120">
    <comment>Number of seconds Fedora http client will wait for data coming across an 
		established http connection.</comment>
  </param>
  <param name="httpClientMaxConnectionsPerHost" value="5">
    <comment>Maximum number of Fedora http client connections allowed to a given host.</comment>
  </param>
  <param name="datastreamDefaultExtension" value="bin">
    <comment>Extension to use when none can be determined from mappings</comment>
  </param>
  <param name="repositoryName" value="Fedora Repository">
    <comment>Defines a human readable name for the Fedora server; default is 
		Fedora Repository.</comment>
  </param>
  <param name="fedoraAppServerContext" value="fedora">
    <comment>Defines the context name for the Fedora server within the 
		application server. If set to eg &quot;myfedora&quot; the URL for Fedora will result
		in http[s]://fedoraServerHost[:fedoraServerPort]/myfedora.</comment>
  </param>
  <param name="datastreamFilenameSource" value="rels label id">
    <comment>determines the source of the filename generated when download=true
		on a datastream dissemination.  Value is space separated list of label: use the datastream label;
		id: use the datastream ID; rels: use the value defined in RELS-INT.  Each
		source is checked in order, and the first containing a value is used.  Omit
		any of the sources if that source is never to be used.  If no sources are to be used,
		and just the default filename and extension below are to be used, specify &quot; &quot;.</comment>
  </param>
  <param name="fedoraRedirectPort" value="8443">
    <comment>Defines the redirect port of the Fedora sever; default is 8443.</comment>
  </param>
  <param name="datastreamDefaultFilename" value="download">
    <comment>Filename to use for datastream downloads when none can be determined from the
		sources listed in datastreamFilenameSource.</comment>
  </param>
  <param name="fedoraServerHost" value="localhost">
    <comment>Defines the host name for the Fedora server, as seen from the 
		outside world.</comment>
  </param>
  <param name="datastreamContentDispositionInlineEnabled" value="true">
    <comment>determines if a content-disposition header specifying &quot;inline&quot; and
		a filename is added to the response for the REST API getDatastreamDissemination
		when no query parameter of download=true is specified.  Browser support for 
		recognising a filename in case of &quot;inline&quot; content disposition is patchy,
		so you may wish to disable the content disposition header in this case and only
		have it provided when download=true is specified, in which case the content disposition
		of &quot;attachment&quot; will be used; which is generally supported.</comment>
  </param>
  <param name="httpClientUserAgent" value="Fedora">
    <comment>The value to be set for the User-Agent HTTP request header.</comment>
  </param>
  <param name="datastreamExtensionMappingLabel" value="always">
    <comment>Controls filename extension mapping when the datastream label is used
		as the source of the filename.  Values are always: always generate an extension
		based on the MIMETYPE, using the default extension if none can be determined; 
		ifmissing: generate an extension if the filename obtained from the source does not
		already contain one (again returning the default if there is no MIMETYPE-to-extension
		mapping is found); never: never generate an extension, use the filename from the source
		as-is</comment>
  </param>
  <param name="datastreamExtensionMappingId" value="ifmissing">
    <comment>Controls filename extension mapping when the datastream ID is used
		as the source of the filename.  Values are as above.</comment>
  </param>
  <param name="datastreamExtensionMappingDefault" value="never">
    <comment>Controls filename extension mapping when no filename can be determined from
		the sources listed in datastreamFilenameSource.  Values are always: always generate an extension
		based on the MIMETYPE (using the default if no appropriate mapping is specified);
		never: never generate an extension.</comment>
  </param>
  <module role="org.fcrepo.server.security.Authorization" class="org.fcrepo.server.security.DefaultAuthorization">
    <comment>Builds and manages Fedora's authorization structure.</comment>
    <param name="REPOSITORY-POLICIES-DIRECTORY" value="data/fedora-xacml-policies/repository-policies" isFilePath="true"/>
    <param name="VALIDATE-REPOSITORY-POLICIES" value="true"/>
    <param name="VALIDATE-OBJECT-POLICIES-FROM-DATASTREAM" value="false"/>
    <param name="REPOSITORY-POLICY-GUITOOL-POLICIES-DIRECTORY" value="data/fedora-xacml-policies/repository-policies-generated-by-policyguitool" isFilePath="true">
      <comment>This parameter is for future use.</comment>
    </param>
    <param name="XACML-COMBINING-ALGORITHM" value="org.jboss.security.xacml.sunxacml.combine.OrderedDenyOverridesPolicyAlg"/>
    <param name="POLICY-SCHEMA-PATH" value="xsd/cs-xacml-schema-policy-01.xsd"/>
    <param name="VALIDATE-OBJECT-POLICIES-FROM-FILE" value="false"/>
    <param name="ENFORCE-MODE" value="enforce-policies"/>
  </module>
  <module role="org.fcrepo.server.security.BackendSecurity" class="org.fcrepo.server.security.DefaultBackendSecurity">
    <comment>Description: Interface to the backend service security 
		configuration. This module initializes backend service security 
		information in the server by parsing the beSecurity configuration file. 
		This file is located in the distribution in 
		$FEDORA_HOME/dist/server/config/beSecurity.xml. The configuration file 
		is read once at server startup.</comment>
    <param name="beSecurity_validation" value="false">
      <comment>Controls whether beSecurity config file is validated 
			against the beSecurityDescription schema. The default is 
			&quot;false&quot;. Valid values are &quot;true&quot; or 
			&quot;false&quot;.</comment>
    </param>
    <param name="beSecurity_char_encoding" value="utf-8">
      <comment>The character encoding used for the beSecurity 
			configuration file. The default is &quot;utf-8&quot;. The value 
			specified must correspond to the character encoding used in the 
			beSecurity configuration file.</comment>
    </param>
  </module>
  <module role="org.fcrepo.server.storage.DOManager" class="org.fcrepo.server.storage.DefaultDOManager">
    <comment>The interface to the storage subsystem.  This provides 
    	context-appropriate DOReaders and DOWriters for reflecting on and 
    	writing to the objects stored in the repository. It also provides 
    	methods for reflecting on the contents of the repository as a whole..</comment>
    <param name="defaultExportFormat" value="info:fedora/fedora-system:FOXML-1.1"/>
    <param name="gSearchUsername" value="exampleUsername">
      <comment>The username for accessing the REST endpoint of the
            Fedora Generic Search service.  This parameter is only required if
            GSearchDOManager is used, and the service requires 
            authentication.</comment>
    </param>
    <param name="fedoraStorageHintProvider" value="org.fcrepo.server.storage.NullStorageHintsProvider">
      <comment>Hints are gathered and passed to the underline storage systems (only Akubra for now).
            These are meta data or contextual information about object or datastream to be added or updated.
            The default implementation is NullStorageHintsProvider; it provides no hints. You you can implement
            your own FedoraStorageHintProvider and drop your implementation to the $CATALINA_HOME/webapps/fedora/WEB_INF/classes
            directory (unpackaged), or the $CATALINA_HOME/webapps/fedora/WEB_INF/lib director (packaged).</comment>
    </param>
    <param name="storageCharacterEncoding" value="UTF-8">
      <comment>If the serialization format is text-based, this is the 
	    	character encoding that should be used. Default is UTF-8.</comment>
    </param>
    <param name="defaultDCControlGroup" value="X">
      <comment>The control group to use for the system-generated DC datastream
            if no DC datastream is present on ingest.  Must be &quot;X&quot; or &quot;M&quot;.</comment>
    </param>
    <param name="defaultRELSControlGroup" value="X">
      <comment>The control group to use for system-generated RELS-EXT and 
            RELS-INT datastreams where these are not already present when
            adding relationships via addRelationship.  Must be &quot;X&quot; or &quot;M&quot;.</comment>
    </param>
    <param name="gSearchPassword" value="examplePassword">
      <comment>The associated password for accessing the REST endpoint
            of the Fedora Generic Search service.  This parameter is only 
            required if GSearchDOManager is used, and the service requires 
            authentication.</comment>
    </param>
    <param name="pidNamespace" value="changeme">
      <comment>This is the namespace id for pids of newly-created objects. 
	    	This should be unique for a repository. It can be from 1 to 17 
	    	characters, and may only contain A-Z, a-z, 0-9, &apos;.&apos;, or &apos;-&apos; (dash).</comment>
    </param>
    <param name="storagePool" value="localMySQLPool">
      <comment>The named connection pool from which read/write database 
	    	connections are to be provided for the storage subsystem (see the 
	    	ConnectionPoolManager module). Default is the default provided by the 
	    	ConnectionPoolManager.</comment>
    </param>
    <param name="gSearchRESTURL" value="http://localhost:8080/fedoragsearch/rest">
      <comment>The REST endpoint of the Fedora Generic Search service.
            This parameter is only required if GSearchDOManager is 
            used.</comment>
    </param>
  </module>
  <module role="org.fcrepo.server.management.Management" class="org.fcrepo.server.management.ManagementModule">
    <comment>The management subsystem. This implements the methods necessary 
		to fulfill API-M requests without regard to:
                 - how the service is exposed
                 - how bytestreams and java types might be marshalled/demarshalled over the wire
                 - how the storage subsystem is implemented.</comment>
    <param name="purgeDelayInMillis" value="60000">
      <comment>Optional, default is 60000 (1 minute).
            This specifies the amount of time between checks to remove
            temporary files uploaded via the API-M upload interface.  During
            each check, old files whose age exceeds uploadStorageMinutes
            will be removed.</comment>
    </param>
    <param name="decorator1" value="org.fcrepo.server.messaging.NotificationInvocationHandler"/>
    <param name="checksumAlgorithm" value="MD5">
      <comment>Specifies which checksumming algorithm is to be used when 
			automatically computing checksums as specified by the above 
			parameter. Valid values are: MD5  SHA-1  SHA-256  SHA-384  SHA-512.</comment>
    </param>
    <param name="autoChecksum" value="false">
      <comment>Controls whether a checksum is automatically computed for 
			every datastream as the datastream is added to the repository. This 
			will allow the integrity of datastream contents to be periodically 
			checked to insure the object is not corrupted.</comment>
    </param>
    <param name="uploadStorageMinutes" value="5">
      <comment>Optional, default is 5.
            This specifies the minimum amount of time that each uploaded
            file should be kept in temporary storage.</comment>
    </param>
  </module>
  <module role="org.fcrepo.server.access.Access" class="org.fcrepo.server.access.DefaultAccess">
    <comment>Description: The access subsystem. This implements the methods 
    	necessary to fulfill API-A requests without regard to:
			- how the service is exposed
			- how bytestreams and java types might be marshalled/demarshalled 
			  over the wire.</comment>
    <param name="doMediateDatastreams" value="false">
      <comment>A boolean switch indicating whether Datastream Mediation is 
	    	activated or not. Datastream Mediation is required if using basic 
	    	authentication for API-A. When basic authentication is enabled for 
	    	API-A, backend services used by custom disseminations may or may not be 
	    	capable of authenticating with the Fedora server. Datastream mediation 
	    	coupled with the backend service configuration information in the 
	    	beSecurity.xml file enables the Fedora server to determine which backend 
	    	services are required to authenticate and which ones are allowed to 
	    	connect without authentication. Datastream mediation provides additional 
	    	repository security by not exposing the physical location of Referenced 
	    	Content datastreams to external mechanisms(services). Instead of 
	    	exposing the actual physical location of Referenced Content datastreams, 
	    	Datastream Mediation functions as a proxy requiring all external 
	    	services to communicate through the Fedora server to resolve the 
	    	location of Referenced Content datastreams. 
	
			IMPORTANT: For Datastream Mediation to function, the Fedora server must 
			be internet accessible using the configured name for fedoraServerHost 
			and fedoraServerPort. For example, using the default fedoraServerHost 
			value of &quot;localhost&quot; will not work if you have remote backend services 
			since the hostname of &quot;localhost&quot; will not be resolvable as the Fedora 
			server by the remote backend services. This requirement can be difficult 
			to satisfy if the Fedora server is located behind a firewall and you do 
			not have ready access to the firewall&apos;s configuration to enable the 
			required access. If the Fedora server is behind a firewall and you have 
			no access to the firewall&apos;s configuration, you are limited to keeping 
			Datastream Mediation turned off. Note that this will also prevent you 
			from using basic authentication with API-A. The default value of 
			doMediateDatastreams is false.</comment>
    </param>
  </module>
  <module role="org.fcrepo.server.access.DynamicAccess" class="org.fcrepo.server.access.DynamicAccessModule">
    <comment>The dynamic behavior module for the access subsystem. This 
		implements the methods necessary to fulfill API-A requests without 
		regard to:
	        - dynamically associating a default behavior definition and mechanism with objects
	        - (Future) dynamically associating other behavior definitions and mechanisms
	          with objects
	        - running disseminations of dynamic behaviors</comment>
    <param name="fedora-system:4" value="org.fcrepo.server.access.defaultdisseminator.DefaultDisseminatorImpl">
      <comment>The class that implements the methods of the default 
			disseminator. These method implementations are &quot;built-in&quot; to the
            Fedora system, and are dynamically associated with every object.
            This class can be though of as implementing an &quot;internal service&quot;
            whereas other disseminators use external services (described by
            WSDL) to do their work.</comment>
    </param>
    <param name="fedora-system:3" value="org.fcrepo.server.access.defaultdisseminator.DefaultDisseminator">
      <comment>The interface that defines the methods of the default 
			disseminator. These methods are &quot;built-in&quot; to the Fedora system, and 
			are dynamically associated with every object.</comment>
    </param>
    <param name="fedora-system:2" value="org.fcrepo.server.access.internalservices.BootstrapImpl">
      <comment>The class that implements the methods of the bootstrap 
			disseminator. These method implementations are &quot;built-in&quot; to the 
			Fedora system, and are dynamically associated with every behavior 
			definition and behavior mechanism object. This class can be thought 
			of as implementing an &quot;internal service&quot; whereas other disseminators 
			use external services (described by WSDL) to do their work.</comment>
    </param>
    <param name="fedora-system:1" value="org.fcrepo.server.access.internalservices.Bootstrap">
      <comment>The interface that defines the methods of the bootstrap 
			disseminator. These methods are &quot;built-in&quot; to the Fedora system, and 
			are dynamically associated with every behavior definition and 
			behavior mechanism object.</comment>
    </param>
  </module>
  <module role="org.fcrepo.server.search.FieldSearch" class="org.fcrepo.server.search.FieldSearchSQLModule">
    <comment>Supports the API-A simpleSearch and advancedSearch methods.</comment>
    <param name="maxResults" value="100">
      <comment>(required, must be &gt; 0) 
            The maximum number of records to 
            return as the result of a search. Even if a client requests more 
            results at a time, this is the cutoff value.</comment>
    </param>
    <param name="indexDCFields" value="true">
      <comment>(optional, default is true) Whether the content of the DC 
	    	datastream should be examined and the contents indexed, for each object.
	        You may wish to save time and space by disabling DC field indexing, 
	        particularly if you have an external search service (such as Fedora 
	        Generic Search) that already fulfills this need. 
	        Note: If you change this value on a Fedora repository that has been 
	        running for some time, you will need to perform a SQL rebuild using the 
	        Fedora Rebuilder tool if you want to change objects that have already 
	        been ingested.</comment>
    </param>
    <param name="maxSecondsPerSession" value="500">
      <comment>(required, must be &gt; 0) 
            The maximum number of seconds that the server guarantees subsequent
            search results may be obtained. This is only used in cases where the
            number of results is greater than maxResults (as specified by the
            server [above] or the client [in the search request]).</comment>
    </param>
    <param name="connectionPool" value="localMySQLPool">
      <comment>(optional) To make unspecified, comment out or delete the 
	    	whole param line as opposed to using an empty string,
            default=ConnectionPoolManager&apos;s default) The connectionPool
            providing the connection to the database to be used. Warning: When
            setting these values, keep in mind that while a session is not timed
            out (maxSecondsPerSession seconds haven&apos;t elapsed, and not all
            results have been requested), a connection from the pool is tied up.
            Therefore, the connectionPool should be at least of size n, large
            enough to accomodate n simultaneous search sessions. The longer
            maxSecondsPerSession is, the more chance you have of tying up all
            available connections from the pool. Therefore, keep
            maxSecondsPerSession fairly low, but still reasonable for an
            automated program or user to serially get a long list of results,
            and make sure you have a connectionPool large enough to accomodate
            your users.</comment>
    </param>
  </module>
  <module role="org.fcrepo.server.resourceIndex.ResourceIndex" class="org.fcrepo.server.resourceIndex.ResourceIndexModule">
    <comment>Supports the ResourceIndex.</comment>
    <param name="syncUpdates" value="false">
      <comment>(optional, default is false)
            Whether to flush the triple buffer before
            returning from object modification operations.
            Specifying this as true will ensure that RI queries 
            immediately reflect the latest triples.
            Specifying false will not provide this guarantee,
            but can significantly reduce roundtrip time for
            API-M operations (depending on the triplestore 
            implementation).</comment>
    </param>
    <param name="alias:test" value="http://example.org/terms#">
      <comment>(optional) Aliases that can be used for queries. The param 
			name of an alias starts with the string &quot;alias:&quot; and is followed by 
			the name of the alias (shortcut) for the value, which is a URI 
			prefix. For example: name=&quot;alias:test&quot; 
			value=&quot;http://example.org/terms#&quot; will allow a query to use 
			test:apple instead of http://example.org/terms#apple</comment>
    </param>
    <param name="level" value="1">
      <comment>(required) 
            Index level. Currently, only 0, and 1 are supported levels. 
            0 = off and 1 = on.
            WARNING: changing the level (except to 0) requires 
            running the Resource Index Rebuilder.</comment>
    </param>
    <!-- Using .env (line 98) confd "toggle" to set the Fedora Resource index using either the default Mulgara or the remote Blazegraph container --> 
    {{if eq (getv "/fedora/resource/index") "blazegraph"}}
    <!--<param name="datastore" value="localMulgaraTriplestore"><comment>(required)Name of the triplestore to use. WARNING: changing the triplestore running the Resource Index Rebuilder.</comment></param>-->
    {{ end }}
    {{if eq (getv "/fedora/resource/index") "mulgara"}}
    <param name="datastore" value="localMulgaraTriplestore"><comment>(required)Name of the triplestore to use. WARNING: changing the triplestore running the Resource Index Rebuilder.</comment></param>
    {{ end }}
  </module>
  <module role="org.fcrepo.oai.OAIProvider" class="org.fcrepo.server.oai.FedoraOAIProviderModule">
    <comment>Description: Exposes the repository for OAI harvesters.</comment>
    <param name="maxRecords" value="100"/>
    <param name="maxHeaders" value="100"/>
    <param name="adminEmails" value="oai-admin@example.org bob@example.org"/>
    <param name="repositoryName" value="Your Fedora Repository Name Here"/>
    <param name="repositoryDomainName" value="example.org"/>
    <param name="friends" value="http://arXiv.org/oai2 http://memory.loc.gov/cgi-bin/oai2_0"/>
  </module>
  <module role="org.fcrepo.server.storage.translation.DOTranslator" class="org.fcrepo.server.storage.translation.DOTranslatorModule">
    <comment>Supports translation from DigitalObject to a stream of some
		         format, and vice-versa. The parameters below specify
		         serializer/deserializer classes to be used for a given format. Those
		         classes must implement the DOSerializer/DODeserializer interfaces.</comment>
    <param name="deserializer_info:fedora/fedora-system:METSFedoraExt-1.1" value="org.fcrepo.server.storage.translation.METSFedoraExt1_1DODeserializer"/>
    <param name="deserializer_info:fedora/fedora-system:METSFedoraExt-1.0" value="org.fcrepo.server.storage.translation.METSFedoraExt1_0DODeserializer"/>
    <param name="serializer_info:fedora/fedora-system:ATOMZip-1.1" value="org.fcrepo.server.storage.translation.AtomZip1_1DOSerializer"/>
    <param name="deserializer_info:fedora/fedora-system:FOXML-1.1" value="org.fcrepo.server.storage.translation.FOXML1_1DODeserializer"/>
    <param name="serializer_info:fedora/fedora-system:METSFedoraExt-1.0" value="org.fcrepo.server.storage.translation.METSFedoraExt1_0DOSerializer"/>
    <param name="serializer_info:fedora/fedora-system:FOXML-1.1" value="org.fcrepo.server.storage.translation.FOXML1_1DOSerializer"/>
    <param name="serializer_info:fedora/fedora-system:FOXML-1.0" value="org.fcrepo.server.storage.translation.FOXML1_0DOSerializer"/>
    <param name="serializer_info:fedora/fedora-system:METSFedoraExt-1.1" value="org.fcrepo.server.storage.translation.METSFedoraExt1_1DOSerializer"/>
    <param name="deserializer_info:fedora/fedora-system:FOXML-1.0" value="org.fcrepo.server.storage.translation.FOXML1_0DODeserializer"/>
    <param name="deserializer_info:fedora/fedora-system:ATOMZip-1.1" value="org.fcrepo.server.storage.translation.AtomZip1_1DODeserializer"/>
    <param name="serializer_info:fedora/fedora-system:ATOM-1.1" value="org.fcrepo.server.storage.translation.Atom1_1DOSerializer"/>
    <param name="deserializer_info:fedora/fedora-system:ATOM-1.1" value="org.fcrepo.server.storage.translation.Atom1_1DODeserializer"/>
  </module>
  <module role="org.fcrepo.server.management.PIDGenerator" class="org.fcrepo.server.management.BasicPIDGenerator">
    <comment>The pid generator.</comment>
    <param name="pidgen_log_dir" value="pidgen"/>
  </module>
  <module role="org.fcrepo.server.messaging.Messaging" class="org.fcrepo.server.messaging.MessagingModule">
    <comment>Fedora's Java Messaging Service (JMS) Module</comment>
    <param name="java.naming.factory.initial" value="org.apache.activemq.jndi.ActiveMQInitialContextFactory"/>
    <param name="java.naming.provider.url" value="vm:(broker:(tcp://localhost:61616))"/>
    <param name="datastore2" value="apimAccessMessages">
      <comment>A datastore representing a JMS Destination for APIM events which do not update the repository</comment>
    </param>
    <param name="datastore1" value="apimUpdateMessages">
      <comment>A datastore representing a JMS Destination for APIM events which update the repository</comment>
    </param>
    <param name="enabled" value="true"/>
  </module>
  <module role="org.fcrepo.server.storage.ConnectionPoolManager" class="org.fcrepo.server.storage.ConnectionPoolManagerImpl">
    <comment>This module facilitates obtaining ConnectionPools</comment>
    <param name="poolNames" value="localMySQLPool"/>
    <param name="defaultPoolName" value="localMySQLPool"/>
  </module>
  <module role="org.fcrepo.server.validation.DOValidator" class="org.fcrepo.server.validation.DOValidatorModule">
    <comment>Description: Supports validation of digital objects, including
             XML Schema validation, Schematron validation (to Fedora Rules schema
             written in Schematron language), and other programatic validation
             including referential integrity checking of existence and
             availability of distributed data and/or services.</comment>
    <param name="xsd_info:fedora/fedora-system:METSFedoraExt-1.0" value="xsd/mets-fedora-ext.xsd">
      <comment>The local path for the Fedora-METS 1.0 XML
            schema used to do XML schema validation of digital objects.</comment>
    </param>
    <param name="xsd_info:fedora/fedora-system:METSFedoraExt-1.1" value="xsd/mets-fedora-ext1-1.xsd">
      <comment>The local path for the Fedora-METS XML
			schema used to do XML schema validation of digital objects.</comment>
    </param>
    <param name="rules_info:fedora/fedora-system:FOXML-1.1" value="schematron/foxmlRules1-1.xml">
      <comment>The local path to the Schematron Rules used for 
			Fedora-specific validation on FOXML 1.1 XML files.</comment>
    </param>
    <param name="rules_info:fedora/fedora-system:METSFedoraExt-1.1" value="schematron/metsExtRules1-1.xml">
      <comment>The local path to the Schematron Rules used for 
			Fedora-specific validation on Fedora-METS XML files.</comment>
    </param>
    <param name="rules_info:fedora/fedora-system:METSFedoraExt-1.0" value="schematron/metsExtRules1-0.xml">
      <comment>The local path to the Schematron Rules used for 
			Fedora-specific validation on Fedora-METS 1.0 XML files.</comment>
    </param>
    <param name="rules_info:fedora/fedora-system:FOXML-1.0" value="schematron/foxmlRules1-0.xml">
      <comment>The local path to the Schematron Rules used for 
    		Fedora-specific validation on FOXML 1.0 XML files.</comment>
    </param>
    <param name="rules_info:fedora/fedora-system:ATOMZip-1.1" value="schematron/atom-bogus.xml">
      <comment>The local path to the Schematron Rules used for 
            Fedora-specific on Atom Zip files.</comment>
    </param>
    <param name="xsd_info:fedora/fedora-system:ATOMZip-1.1" value="xsd/atom.xsd">
      <comment>The local path for the Atom XML schema used to do XML 
			schema validation of digital objects</comment>
    </param>
    <param name="xsd_info:fedora/fedora-system:FOXML-1.1" value="xsd/foxml1-1.xsd">
      <comment>The local path for the Fedora FOXML 1.1 XML schema
             used to do XML schema validation of digital objects</comment>
    </param>
    <param name="xsd_xacml_policy1.0" value="xsd/cs-xacml-schema-policy-01.xsd">
      <comment>The local path for the OASIS XACML XML policy schema 
			used to do XML schema validation of XACML policies.</comment>
    </param>
    <param name="schtron_preprocessor" value="schematron/preprocessor.xslt"/>
    <param name="tempDir" value="work">
      <comment>(required)
            This is a directory that the validation module can use as a work space, as
            when it must write a temporary file.</comment>
    </param>
    <param name="xsd_info:fedora/fedora-system:FOXML-1.0" value="xsd/foxml1-0.xsd">
      <comment>The local path for the Fedora FOXML 1.0 XML schema
             used to do XML schema validation of digital objects</comment>
    </param>
    <param name="xsd_info:fedora/fedora-system:ATOM-1.1" value="xsd/atom.xsd">
      <comment>The local path for the Atom XML schema used to do XML 
			schema validation of digital objects</comment>
    </param>
    <param name="rules_info:fedora/fedora-system:ATOM-1.1" value="schematron/atom-bogus.xml">
      <comment>The local path to the Schematron Rules used for 
            Fedora-specific on Atom XML files.</comment>
    </param>
  </module>
  <module role="org.fcrepo.server.storage.ExternalContentManager" class="org.fcrepo.server.storage.DefaultExternalContentManager">
    <comment>This module facilitates obtaining external content via HTTP</comment>
  </module>
  <datastore id="localMySQLPool">
    <comment>MySQL database on localhost with db name of fedora3. Each
             connection pool instance has several configuration parameter that
             can be used to tune the options for the connection pool. It is
             recommended that you not change the default values unless you are
             trying to address a specific performance issue. For additional
             information regarding connection pool options, refer to the Apache
             Commons Pool API documentation at
             http://jakarta.apache.org/commons/pool/apidocs/index.html.</comment>
    <param name="minIdle" value="0">
      <comment>The minimum of idle instances in pool.</comment>
    </param>
    <param name="validationQuery" value="select 1">
      <comment>The query to run when validating connections.
            Connections are validated according to the testOnBorrow,
            testOnReturn, and testWhileIdle configuration values.
            If this is specified, it must be a SQL SELECT statement
            that returns at least one row.  If this is NOT specified,
            validation tests will not be run.</comment>
    </param>
    <param name="maxWait" value="-1">
      <comment>The maximum amount of time in milliseconds the 
			borrowObject() method should wait before throwing an Exception when 
            whenExhaustedAction is set to WHEN_EXHAUSTED_BLOCK. A value less 
            than zero indicates block indefinitely.</comment>
    </param>
    <param name="whenExhaustedAction" value="1">
      <comment>Action to take when a new object is requested and the the pool has
            reached maximum number of active objects. Valid values are:
				0 (fail i.e., throw Exception) 
				1 (block i.e., wait until pool resources are freed) 
				2 (grow i.e., increase the size of the pool).</comment>
    </param>
    <param name="numTestsPerEvictionRun" value="3">
      <comment>The number of objects to be examined on each run of idle 
			evictor thread (if applicable). A value less than zero indicates 
			that ceil(numIdle)/abs(numTestsPerEvictionRun) will be run.</comment>
    </param>
    <param name="dbUsername" value="{{getv "/fedora/db/user"}}">
      <comment>The database user name.</comment>
    </param>
    <param name="maxIdle" value="10">
      <comment>The maximum number of idle instances in pool.</comment>
    </param>
    <param name="testOnBorrow" value="true">
      <comment>When true objects are validated before borrowed from the 
			pool.</comment>
    </param>
    <param name="testWhileIdle" value="true">
      <comment>When true, objects are validated by the idle object evictor 
			thread.</comment>
    </param>
    <param name="minEvictableIdleTimeMillis" value="1800000">
      <comment>The minimum amount of time in milliseconds an object can be 
			idle in pool before eligible for eviction (if applicable). A value 
            less than zero indicates no object will be evicted due to idle time 
            alone.</comment>
    </param>
    <param name="timeBetweenEvictionRunsMillis" value="-1">
      <comment>The time in milliseconds to sleep between runs of the idle 
			object evictor thread. A value less than zero indicates no idle 
			evictor thread is run.</comment>
    </param>
    <param name="testOnReturn" value="true">
      <comment>When true, objects are validated before returned to the 
			pool.</comment>
    </param>
    <param name="jdbcURL" value="jdbc:mysql://mysql:3306/{{getv "/fedora/db"}}?useUnicode=true&amp;amp;characterEncoding=UTF-8&amp;amp;autoReconnect=true">
      <comment>The JDBC connection URL.</comment>
    </param>
    <param name="ddlConverter" value="org.fcrepo.server.utilities.MySQLDDLConverter"/>
    <param name="jdbcDriverClass" value="com.mysql.jdbc.Driver">
      <comment>The JDBC driver class name.</comment>
    </param>
    <param name="dbPassword" value="{{getv "/fedora/db/pass"}}">
      <comment>The database password.</comment>
    </param>
    <param name="maxActive" value="100">
      <comment>The maximum number of active instances in pool.</comment>
    </param>
  </datastore>
  <datastore id="localDerbyPool">
    <comment>Derby database on localhost running on port 1527 Each
            connection pool instance has several configuration parameter that
            can be used to tune the options for the connection pool. It is
            recommended that you not change the default values unless you are
            trying to address a specific performance issue. For additional
            information regarding connection pool options, refer to the Apache
            Commons Pool API documentation at
            http://jakarta.apache.org/commons/pool/apidocs/index.html.</comment>
    <param name="minIdle" value="0">
      <comment>The minimum of idle instances in pool.</comment>
    </param>
    <param name="maxWait" value="-1">
      <comment>The maximum amount of time in milliseconds the 
            borrowObject() method should wait before throwing an Exception when 
            whenExhaustedAction is set to WHEN_EXHAUSTED_BLOCK. A value less 
            than zero indicates block indefinitely.</comment>
    </param>
    <param name="whenExhaustedAction" value="1">
      <comment>Action to take when a new object is requested and the the pool has
            reached maximum number of active objects. Valid values are:
                0 (fail i.e., throw Exception) 
                1 (block i.e., wait until pool resources are freed) 
                2 (grow i.e., increase the size of the pool).</comment>
    </param>
    <param name="numTestsPerEvictionRun" value="3">
      <comment>The number of objects to be examined on each run of idle 
            evictor thread (if applicable). A value less than zero indicates 
            that ceil(numIdle)/abs(numTestsPerEvictionRun) will be run.</comment>
    </param>
    <param name="dbUsername" value="fedoraAdmin">
      <comment>The database user name.</comment>
    </param>
    <param name="maxIdle" value="10">
      <comment>The maximum number of idle instances in pool.</comment>
    </param>
    <param name="testOnBorrow" value="true">
      <comment>When true objects are validated before borrowed from the 
            pool.</comment>
    </param>
    <param name="testWhileIdle" value="true">
      <comment>When true, objects are validated by the idle object evictor 
            thread.</comment>
    </param>
    <param name="minEvictableIdleTimeMillis" value="1800000">
      <comment>The minimum amount of time in milliseconds an object can be 
            idle in pool before eligible for eviction (if applicable). A value 
            less than zero indicates no object will be evicted due to idle time 
            alone.</comment>
    </param>
    <param name="timeBetweenEvictionRunsMillis" value="-1">
      <comment>The time in milliseconds to sleep between runs of the idle 
            object evictor thread. A value less than zero indicates no idle 
            evictor thread is run.</comment>
    </param>
    <param name="testOnReturn" value="true">
      <comment>When true, objects are validated before returned to the 
            pool.</comment>
    </param>
    <param name="jdbcURL" value="jdbc:derby:/opt/fedora/current/derby/fedora3;create=true">
      <comment>The JDBC connection URL.</comment>
    </param>
    <param name="ddlConverter" value="org.fcrepo.server.utilities.DerbyDDLConverter"/>
    <param name="jdbcDriverClass" value="org.apache.derby.jdbc.EmbeddedDriver">
      <comment>The JDBC driver class name.</comment>
    </param>
    <param name="dbPassword" value="fedoraAdmin">
      <comment>The database password.</comment>
    </param>
    <param name="maxActive" value="100">
      <comment>The maximum number of active instances in pool.</comment>
    </param>
  </datastore>
  <datastore id="localOraclePool">
    <comment>Oracle database on localhost with SID=fedora3 Each
            connection pool instance has several configuration parameter that
            can be used to tune the options for the connection pool. It is
            recommended that you not change the default values unless you are
            trying to address a specific performance issue. For additional
            information regarding connection pool options, refer to the Apache
            Commons Pool API documentation at
            http://jakarta.apache.org/commons/pool/apidocs/index.html.</comment>
    <param name="minIdle" value="0">
      <comment>The minimum of idle instances in pool.</comment>
    </param>
    <param name="validationQuery" value="select &apos;validationQuery&apos; from dual">
      <comment>The query to run when validating connections.
            Connections are validated according to the testOnBorrow,
            testOnReturn, and testWhileIdle configuration values.
            If this is specified, it must be a SQL SELECT statement
            that returns at least one row.  If this is NOT specified,
            validation tests will not be run.</comment>
    </param>
    <param name="connection.SetBigStringTryClob" value="true"/>
    <param name="maxWait" value="-1">
      <comment>The maximum amount of time in milliseconds the 
			borrowObject() method should wait before throwing an Exception when 
            whenExhaustedAction is set to WHEN_EXHAUSTED_BLOCK. A value less 
            than zero indicates block indefinitely.</comment>
    </param>
    <param name="whenExhaustedAction" value="1">
      <comment>Action to take when a new object is requested and the the pool has
            reached maximum number of active objects. Valid values are:
				0 (fail i.e., throw Exception) 
				1 (block i.e., wait until pool resources are freed) 
				2 (grow i.e., increase the size of the pool).</comment>
    </param>
    <param name="numTestsPerEvictionRun" value="3">
      <comment>The number of objects to be examined on each run of idle 
			evictor thread (if applicable). A value less than zero indicates 
			that ceil(numIdle)/abs(numTestsPerEvictionRun) will be run.</comment>
    </param>
    <param name="dbUsername" value="fedoraAdmin">
      <comment>The database user name.</comment>
    </param>
    <param name="maxIdle" value="10">
      <comment>The maximum number of idle instances in pool.</comment>
    </param>
    <param name="testOnBorrow" value="true">
      <comment>When true objects are validated before borrowed from the 
			pool.</comment>
    </param>
    <param name="testWhileIdle" value="true">
      <comment>When true, objects are validated by the idle object evictor 
			thread.</comment>
    </param>
    <param name="minEvictableIdleTimeMillis" value="1800000">
      <comment>The minimum amount of time in milliseconds an object can be 
			idle in pool before eligible for eviction (if applicable). A value 
            less than zero indicates no object will be evicted due to idle time 
            alone.</comment>
    </param>
    <param name="timeBetweenEvictionRunsMillis" value="-1">
      <comment>The time in milliseconds to sleep between runs of the idle 
			object evictor thread. A value less than zero indicates no idle 
			evictor thread is run.</comment>
    </param>
    <param name="testOnReturn" value="true">
      <comment>When true, objects are validated before returned to the 
			pool.</comment>
    </param>
    <param name="jdbcURL" value="jdbc:oracle:thin:@localhost:1521:fedora3">
      <comment>The JDBC connection URL.</comment>
    </param>
    <param name="ddlConverter" value="org.fcrepo.server.utilities.OracleDDLConverter"/>
    <param name="jdbcDriverClass" value="oracle.jdbc.OracleDriver">
      <comment>The JDBC driver class name.</comment>
    </param>
    <param name="dbPassword" value="fedoraAdmin">
      <comment>The database password.</comment>
    </param>
    <param name="maxActive" value="100">
      <comment>The maximum number of active instances in pool.</comment>
    </param>
  </datastore>
  <datastore id="localPostgreSQLPool">
    <comment>PostgreSQL database on localhost with db name of fedora3. Each
             connection pool instance has several configuration parameter that
             can be used to tune the options for the connection pool. It is
             recommended that you not change the default values unless you are
             trying to address a specific performance issue. For additional
             information regarding connection pool options, refer to the Apache
             Commons Pool API documentation at
             http://jakarta.apache.org/commons/pool/apidocs/index.html.</comment>
    <param name="minIdle" value="0">
      <comment>The minimum of idle instances in pool.</comment>
    </param>
    <param name="validationQuery" value="select 1">
      <comment>The query to run when validating connections.
            Connections are validated according to the testOnBorrow,
            testOnReturn, and testWhileIdle configuration values.
            If this is specified, it must be a SQL SELECT statement
            that returns at least one row.  If this is NOT specified,
            validation tests will not be run.</comment>
    </param>
    <param name="maxWait" value="-1">
      <comment>The maximum amount of time in milliseconds the 
			borrowObject() method should wait before throwing an Exception when 
            whenExhaustedAction is set to WHEN_EXHAUSTED_BLOCK. A value less 
            than zero indicates block indefinitely.</comment>
    </param>
    <param name="whenExhaustedAction" value="1">
      <comment>Action to take when a new object is requested and the the pool has
            reached maximum number of active objects. Valid values are:
				0 (fail i.e., throw Exception) 
				1 (block i.e., wait until pool resources are freed) 
				2 (grow i.e., increase the size of the pool).</comment>
    </param>
    <param name="numTestsPerEvictionRun" value="3">
      <comment>The number of objects to be examined on each run of idle 
			evictor thread (if applicable). A value less than zero indicates 
			that ceil(numIdle)/abs(numTestsPerEvictionRun) will be run.</comment>
    </param>
    <param name="dbUsername" value="fedoraAdmin">
      <comment>The database user name.</comment>
    </param>
    <param name="maxIdle" value="10">
      <comment>The maximum number of idle instances in pool.</comment>
    </param>
    <param name="testOnBorrow" value="true">
      <comment>When true objects are validated before borrowed from the 
			pool.</comment>
    </param>
    <param name="testWhileIdle" value="true">
      <comment>When true, objects are validated by the idle object evictor 
			thread.</comment>
    </param>
    <param name="minEvictableIdleTimeMillis" value="1800000">
      <comment>The minimum amount of time in milliseconds an object can be 
			idle in pool before eligible for eviction (if applicable). A value 
            less than zero indicates no object will be evicted due to idle time 
            alone.</comment>
    </param>
    <param name="timeBetweenEvictionRunsMillis" value="-1">
      <comment>The time in milliseconds to sleep between runs of the idle 
			object evictor thread. A value less than zero indicates no idle 
			evictor thread is run.</comment>
    </param>
    <param name="testOnReturn" value="true">
      <comment>When true, objects are validated before returned to the 
			pool.</comment>
    </param>
    <param name="jdbcURL" value="jdbc:postgresql:fedora3">
      <comment>The JDBC connection URL.</comment>
    </param>
    <param name="ddlConverter" value="org.fcrepo.server.utilities.PostgresDDLConverter"/>
    <param name="jdbcDriverClass" value="org.postgresql.Driver">
      <comment>The JDBC driver class name.</comment>
    </param>
    <param name="dbPassword" value="fedoraAdmin">
      <comment>The database password.</comment>
    </param>
    <param name="maxActive" value="100">
      <comment>The maximum number of active instances in pool.</comment>
    </param>
  </datastore>

  <datastore id="localMulgaraTriplestore">
    <comment>local Mulgara Triplestore used by the Resource Index</comment>
    <param name="autoFlushDormantSeconds" value="5">
      <comment>Seconds of buffer inactivity that will trigger an 
			auto-flush. If this threshold is reached, flushing will occur in the 
			background, during which time the buffer is still available for 
			writing.</comment>
    </param>
    <param name="autoTextIndex" value="false">
      <comment>Whether to propagate adds/deletes to a full-text 
			[Full-Text] model automatically. While a very useful feature, 
			enabling full-text indexing adds significantly to object ingest 
			times. If true, the text model will be named modelName-fullText. 
			Note that if this is true and autoCreate is true, the text model 
			will also be created if it doesn&apos;t already exist.</comment>
    </param>
    <param name="serverName" value="fedora">
      <comment>The server name for rmi binding.</comment>
    </param>
    <param name="readOnly" value="false">
      <comment>Whether the triplestore should be read-only. Most Fedora 
			repositories will set this to false.</comment>
    </param>
    <param name="autoCreate" value="true">
      <comment>Create the model if it doesn&apos;t already exist. 
			At startup, the model will be automatically created. In addition, an 
			XML schema datatyped model named &quot;xsd&quot; will also be automatically 
			created.</comment>
    </param>
    <param name="remote" value="false">
      <comment>Tells the connector to communicate with Mulgara in remote or 
			local mode. If true, the host parameter must be defined. If false,
			the path parameter must be defined.</comment>
    </param>
    <param name="path" value="data/resourceIndex" isFilePath="true">
      <comment>The local path to the main triplestore directory.</comment>
    </param>
    <param name="modelName" value="ri">
      <comment>The name of the model to use.</comment>
    </param>
    <param name="bufferSafeCapacity" value="80000">
      <comment>The maximum size the buffer can reach before being forcibly 
			flushed. If this threshold is reached, flushing will occur in the 
			foreground and the buffer will be locked for writing until it is 
			finished. This should be larger than autoFlushBufferSize.</comment>
    </param>
    <param name="poolMaxGrowth" value="-1">
      <comment>Maximum number of additional sessions the pool may add. If 
			specified as -1, no limit will be placed on pool growth.</comment>
    </param>
    <param name="connectorClassName" value="org.trippi.impl.mulgara.MulgaraConnector">
      <comment>The name of the Trippi Connector class used to communicate 
			with the triplestore.</comment>
    </param>
    <param name="bufferFlushBatchSize" value="40000">
      <comment>The number of updates to send to the triplestore at a time. 
			This should be the same size as, or smaller than 
			autoFlushBufferSize.</comment>
    </param>
    <param name="autoFlushBufferSize" value="40000">
      <comment>The size at which the buffer should be auto-flushed. If 
			this threshold is reached, flushing will occur in the background, 
			during which time the buffer is still available for 
			writing.</comment>
    </param>
    <param name="poolInitialSize" value="3">
      <comment>The initial size of the session pool used for queries. 
			Note: A value of 0 will cause the Resource Index to operate in 
			synchronized mode: concurrent read/write requests are put in a queue 
			and handled in FIFO order; this will severely impair performance and 
			is only intended for debugging.</comment>
    </param>
  </datastore>
  <datastore id="localPostgresMPTTriplestore">
    <comment>Example local MPTStore backed by Postgres.
		  To use this triplestore for the Resource Index:
		  1) In fedora.fcfg, change the "datastore" parameter of the
		     ResourceIndex module to localPostgresMPTTriplestore.
		  2) Login to your Postgres server as an administrative user and
		     run the following commands:
		       CREATE ROLE "fedoraAdmin" LOGIN PASSWORD 'fedoraAdmin'
		         NOINHERIT CREATEDB
		         VALID UNTIL 'infinity';
		       CREATE DATABASE "riTriples"
		         WITH ENCODING='SQL_ASCII'
		         OWNER="fedoraAdmin";
		  3) Make sure you can login to your Postgres server as fedoraAdmin.
		  4) Download the appropriate Postgres JDBC 3 driver from 
		     http://jdbc.postgresql.org/download.html
		     and make sure it's accessible to your servlet container.
		     If you're running Tomcat, putting it in common/lib/ will work.
		  5) For Postgres 9.1+, set "backslashIsEscape" to "false"; for earlier
		     versions of Postgres, set to "true".</comment>
    <param name="jdbcDriver" value="org.postgresql.Driver"/>
    <param name="autoFlushDormantSeconds" value="5"/>
    <param name="ddlGenerator" value="org.nsdl.mptstore.impl.postgres.PostgresDDLGenerator"/>
    <param name="fetchSize" value="1000"/>
    <param name="poolMaxSize" value="10"/>
    <param name="password" value="fedoraAdmin"/>
    <param name="bufferSafeCapacity" value="2000"/>
    <param name="jdbcURL" value="jdbc:postgresql://localhost/riTriples"/>
    <param name="connectorClassName" value="org.trippi.impl.mpt.MPTConnector"/>
    <param name="backslashIsEscape" value="false"/>
    <param name="bufferFlushBatchSize" value="1000"/>
    <param name="autoFlushBufferSize" value="1000"/>
    <param name="poolInitialSize" value="3"/>
    <param name="username" value="fedoraAdmin"/>
  </datastore>
  <datastore id="apimUpdateMessages">
    <comment>Messaging Destination for API-M events which update the repository</comment>
    <param name="name" value="fedora.apim.update"/>
    <param name="type" value="queue">
      <comment>Optional, defaults to topic.</comment>
    </param>
    <param name="messageTypes" value="apimUpdate">
      <comment>A space-separated list of message types that will be 
            delivered to this Destination. Currently, &quot;apimUpdate&quot; and 
            &quot;apimAccess&quot; are the only supported message types.</comment>
    </param>
  </datastore>
  <datastore id="apimAccessMessages">
    <comment>Messaging Destination for API-M events which did not make changes to the repository</comment>
    <param name="name" value="fedora.apim.access"/>
    <param name="type" value="topic">
      <comment>Optional, defaults to topic.</comment>
    </param>
    <param name="messageTypes" value="apimAccess">
      <comment>A space-separated list of message types that will be 
            delivered to this Destination. Currently, &quot;apimUpdate&quot; and 
            &quot;apimAccess&quot; are the only supported message types.</comment>
    </param>
  </datastore>
</server>
