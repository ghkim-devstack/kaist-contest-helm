--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: bn_keycloak
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO bn_keycloak;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO bn_keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO bn_keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO bn_keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO bn_keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO bn_keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO bn_keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO bn_keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO bn_keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO bn_keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO bn_keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO bn_keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO bn_keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO bn_keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO bn_keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO bn_keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO bn_keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO bn_keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO bn_keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO bn_keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);


ALTER TABLE public.credential OWNER TO bn_keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO bn_keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO bn_keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO bn_keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO bn_keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO bn_keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO bn_keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO bn_keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO bn_keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO bn_keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO bn_keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO bn_keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO bn_keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO bn_keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO bn_keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO bn_keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO bn_keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO bn_keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO bn_keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO bn_keycloak;

--
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO bn_keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.keycloak_group OWNER TO bn_keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO bn_keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO bn_keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO bn_keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO bn_keycloak;

--
-- Name: org; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO bn_keycloak;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO bn_keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO bn_keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO bn_keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO bn_keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO bn_keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO bn_keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO bn_keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO bn_keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO bn_keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO bn_keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO bn_keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO bn_keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO bn_keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO bn_keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO bn_keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO bn_keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO bn_keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO bn_keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO bn_keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO bn_keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO bn_keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO bn_keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO bn_keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO bn_keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO bn_keycloak;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO bn_keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO bn_keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO bn_keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO bn_keycloak;

--
-- Name: server_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.server_config OWNER TO bn_keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO bn_keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO bn_keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO bn_keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO bn_keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO bn_keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO bn_keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO bn_keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO bn_keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO bn_keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO bn_keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
20a46fc4-5fa0-450e-878d-ba92923d4ca4	37fa8420-3e9e-4f09-a745-f7316abf36c4
fe025fc7-db60-4800-9e44-86cd9c082362	56e60bf8-e687-457c-81c4-0d20fd5ab0e9
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
bfe02fb5-2c2c-4ae1-bb17-c6671301bdce	\N	auth-cookie	1c48905a-b826-47d5-8c26-a03f5a248c68	92aa0893-d983-4ce7-bb95-f477bf502755	2	10	f	\N	\N
b6be449e-0052-4056-8451-950a2ffa375e	\N	auth-spnego	1c48905a-b826-47d5-8c26-a03f5a248c68	92aa0893-d983-4ce7-bb95-f477bf502755	3	20	f	\N	\N
d86a84f0-4bd3-4358-a37b-1de2c684f052	\N	identity-provider-redirector	1c48905a-b826-47d5-8c26-a03f5a248c68	92aa0893-d983-4ce7-bb95-f477bf502755	2	25	f	\N	\N
ce19a8a6-12e1-47d4-9793-b92511ffc2cf	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	92aa0893-d983-4ce7-bb95-f477bf502755	2	30	t	c6395fa4-cb42-4c58-89b9-4ae98235a0a6	\N
71a7a384-7bed-4367-a2b4-23ee7aea6851	\N	auth-username-password-form	1c48905a-b826-47d5-8c26-a03f5a248c68	c6395fa4-cb42-4c58-89b9-4ae98235a0a6	0	10	f	\N	\N
241f3451-8706-43b4-86e6-3afeee97c48a	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	c6395fa4-cb42-4c58-89b9-4ae98235a0a6	1	20	t	b6ab7f1e-16e1-491a-b704-ba65379b98d5	\N
b984b9e4-e054-4a93-98bd-ad8b5db2b8c5	\N	conditional-user-configured	1c48905a-b826-47d5-8c26-a03f5a248c68	b6ab7f1e-16e1-491a-b704-ba65379b98d5	0	10	f	\N	\N
0f42c767-e22a-4f1a-97a8-5487f1fa3502	\N	auth-otp-form	1c48905a-b826-47d5-8c26-a03f5a248c68	b6ab7f1e-16e1-491a-b704-ba65379b98d5	0	20	f	\N	\N
8b013ece-df0e-4cee-bf18-5cc6b2a48088	\N	direct-grant-validate-username	1c48905a-b826-47d5-8c26-a03f5a248c68	24a83ae9-52cd-4bab-8d85-e8dbc0c6ba10	0	10	f	\N	\N
d2b1e89a-4caf-44bd-b9fc-667a8ace8d8a	\N	direct-grant-validate-password	1c48905a-b826-47d5-8c26-a03f5a248c68	24a83ae9-52cd-4bab-8d85-e8dbc0c6ba10	0	20	f	\N	\N
81a3b513-acc5-42a4-adac-4d31b69d507a	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	24a83ae9-52cd-4bab-8d85-e8dbc0c6ba10	1	30	t	b4977d8b-7aa9-42b8-b26e-7230184165b5	\N
0824403d-83bd-496b-82dc-1de731d31492	\N	conditional-user-configured	1c48905a-b826-47d5-8c26-a03f5a248c68	b4977d8b-7aa9-42b8-b26e-7230184165b5	0	10	f	\N	\N
ac8006ae-e4be-4e0e-bf68-e8e5f382984c	\N	direct-grant-validate-otp	1c48905a-b826-47d5-8c26-a03f5a248c68	b4977d8b-7aa9-42b8-b26e-7230184165b5	0	20	f	\N	\N
bef25c48-5ca4-4a45-9584-84f83a475684	\N	registration-page-form	1c48905a-b826-47d5-8c26-a03f5a248c68	e5f64655-8f5e-41cf-86ab-62a81cf5857a	0	10	t	93ef3672-9618-4a38-a98a-2d9e512421b2	\N
4bffe0a2-f7c3-41da-8435-4607de2ab266	\N	registration-user-creation	1c48905a-b826-47d5-8c26-a03f5a248c68	93ef3672-9618-4a38-a98a-2d9e512421b2	0	20	f	\N	\N
a26a7799-83ce-44a9-bbdd-119d108f4f6d	\N	registration-password-action	1c48905a-b826-47d5-8c26-a03f5a248c68	93ef3672-9618-4a38-a98a-2d9e512421b2	0	50	f	\N	\N
d55c03e3-2735-490e-be7e-2338d9f102ff	\N	registration-recaptcha-action	1c48905a-b826-47d5-8c26-a03f5a248c68	93ef3672-9618-4a38-a98a-2d9e512421b2	3	60	f	\N	\N
9310d5d2-b486-479e-bd48-eb5d614f68df	\N	registration-terms-and-conditions	1c48905a-b826-47d5-8c26-a03f5a248c68	93ef3672-9618-4a38-a98a-2d9e512421b2	3	70	f	\N	\N
45e9c6e9-843d-441f-99ef-ebb755c7bbc2	\N	reset-credentials-choose-user	1c48905a-b826-47d5-8c26-a03f5a248c68	41b0b013-4d02-4b3d-a916-f26a91ee7222	0	10	f	\N	\N
92063a14-7ebb-48bc-91cd-27970d9d3ce5	\N	reset-credential-email	1c48905a-b826-47d5-8c26-a03f5a248c68	41b0b013-4d02-4b3d-a916-f26a91ee7222	0	20	f	\N	\N
db0fba36-7cbf-4095-89e2-a28fd432be22	\N	reset-password	1c48905a-b826-47d5-8c26-a03f5a248c68	41b0b013-4d02-4b3d-a916-f26a91ee7222	0	30	f	\N	\N
0e133853-d40b-4e60-8ee6-30b614ee962d	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	41b0b013-4d02-4b3d-a916-f26a91ee7222	1	40	t	d6774298-23ed-43c8-9ddf-f947af6e41f0	\N
deb74b78-eee7-4ce7-b42b-1540f8bf8f4b	\N	conditional-user-configured	1c48905a-b826-47d5-8c26-a03f5a248c68	d6774298-23ed-43c8-9ddf-f947af6e41f0	0	10	f	\N	\N
553564b6-654f-498f-9bf6-ce28ff9e86a0	\N	reset-otp	1c48905a-b826-47d5-8c26-a03f5a248c68	d6774298-23ed-43c8-9ddf-f947af6e41f0	0	20	f	\N	\N
ab0a2795-3f2f-494d-8d05-74168287cf4a	\N	client-secret	1c48905a-b826-47d5-8c26-a03f5a248c68	db0ba350-e259-467d-be57-1c60cb213f8f	2	10	f	\N	\N
cccdad2e-a1d9-46aa-b722-5cc2eb055a06	\N	client-jwt	1c48905a-b826-47d5-8c26-a03f5a248c68	db0ba350-e259-467d-be57-1c60cb213f8f	2	20	f	\N	\N
f661fd44-eec3-4d0a-8aee-f91ca5fa2c5b	\N	client-secret-jwt	1c48905a-b826-47d5-8c26-a03f5a248c68	db0ba350-e259-467d-be57-1c60cb213f8f	2	30	f	\N	\N
228e36f6-6a72-4ad2-99f9-a7cb8c223c82	\N	client-x509	1c48905a-b826-47d5-8c26-a03f5a248c68	db0ba350-e259-467d-be57-1c60cb213f8f	2	40	f	\N	\N
848a920c-1de9-4301-bb20-4d094acad194	\N	idp-review-profile	1c48905a-b826-47d5-8c26-a03f5a248c68	c653811b-3d31-4416-9025-1b7c4cb3acbb	0	10	f	\N	d82bc2c4-be3a-4b75-9640-a4fe0e428d3e
9fa7ffc7-f561-448a-bc02-3caf73d4facc	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	c653811b-3d31-4416-9025-1b7c4cb3acbb	0	20	t	1927fa50-bedd-4aae-a837-bb7c36db8dda	\N
90a15fc3-dfa7-4eda-bcfb-fcc70fce6626	\N	idp-create-user-if-unique	1c48905a-b826-47d5-8c26-a03f5a248c68	1927fa50-bedd-4aae-a837-bb7c36db8dda	2	10	f	\N	88823cd5-a353-47b0-b2b2-e986e89551c4
e132dafe-3760-4bce-a093-29e485c1049e	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	1927fa50-bedd-4aae-a837-bb7c36db8dda	2	20	t	ae13f0a1-381c-4e1e-a027-272781a4b0d1	\N
9d1bc0cd-bca7-4bcc-ac9b-d13e7d0d1e0c	\N	idp-confirm-link	1c48905a-b826-47d5-8c26-a03f5a248c68	ae13f0a1-381c-4e1e-a027-272781a4b0d1	0	10	f	\N	\N
d34d74eb-ba1b-4e04-a73a-efa94a781b99	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	ae13f0a1-381c-4e1e-a027-272781a4b0d1	0	20	t	4c6ac8c3-d2a7-431c-951b-55a3609cb393	\N
79006345-6773-4690-b5d3-eb59402679ba	\N	idp-email-verification	1c48905a-b826-47d5-8c26-a03f5a248c68	4c6ac8c3-d2a7-431c-951b-55a3609cb393	2	10	f	\N	\N
5bffd4f9-4cf7-4519-bc04-5d44a178be62	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	4c6ac8c3-d2a7-431c-951b-55a3609cb393	2	20	t	1165a20a-36da-4900-9b1b-32ca6839297f	\N
4f6dd8aa-96a1-4796-b2b0-ea2d9f6c3246	\N	idp-username-password-form	1c48905a-b826-47d5-8c26-a03f5a248c68	1165a20a-36da-4900-9b1b-32ca6839297f	0	10	f	\N	\N
1a2937e7-60d8-460a-bf3a-9ce17eb70ce3	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	1165a20a-36da-4900-9b1b-32ca6839297f	1	20	t	ce64a29f-dbec-4c61-897e-09af7f694fff	\N
2bc1f238-346c-45b7-9f7f-42bcbdf57f2b	\N	conditional-user-configured	1c48905a-b826-47d5-8c26-a03f5a248c68	ce64a29f-dbec-4c61-897e-09af7f694fff	0	10	f	\N	\N
96a1fc2e-f48d-4939-ad5a-518a1c1c3e52	\N	auth-otp-form	1c48905a-b826-47d5-8c26-a03f5a248c68	ce64a29f-dbec-4c61-897e-09af7f694fff	0	20	f	\N	\N
e13ff454-0f6a-48b6-9786-9a6a636e2103	\N	http-basic-authenticator	1c48905a-b826-47d5-8c26-a03f5a248c68	ce74ccbf-ede4-4dfd-b332-7ca0aa98ff70	0	10	f	\N	\N
34c53570-03c9-4e16-a6f3-bec366746432	\N	docker-http-basic-authenticator	1c48905a-b826-47d5-8c26-a03f5a248c68	3a183477-cd0f-4fa9-93ed-66248dc89735	0	10	f	\N	\N
28013791-89b3-4245-aae7-292a4b968494	\N	auth-cookie	98deb0a8-a0bc-4d66-9005-e0960be33c64	25c211c7-72a9-4185-9e80-6fd78e1b3658	2	10	f	\N	\N
473694b9-1566-40f1-891d-d82b1823d2fe	\N	auth-spnego	98deb0a8-a0bc-4d66-9005-e0960be33c64	25c211c7-72a9-4185-9e80-6fd78e1b3658	3	20	f	\N	\N
173e232d-a198-4546-9924-6d614cf377ca	\N	identity-provider-redirector	98deb0a8-a0bc-4d66-9005-e0960be33c64	25c211c7-72a9-4185-9e80-6fd78e1b3658	2	25	f	\N	\N
4edc0b74-a31c-4c36-afb8-61317cf97f22	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	25c211c7-72a9-4185-9e80-6fd78e1b3658	2	30	t	a767fc24-11d9-4871-971b-870f7d60d5ec	\N
bae2c45f-a5c0-4ed0-b187-e72dd1cf591f	\N	auth-username-password-form	98deb0a8-a0bc-4d66-9005-e0960be33c64	a767fc24-11d9-4871-971b-870f7d60d5ec	0	10	f	\N	\N
cb2dec35-f06e-45b0-bf27-9d6f7a01b4c3	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	a767fc24-11d9-4871-971b-870f7d60d5ec	1	20	t	06ceef0a-ad43-4f34-a79b-f0296393f915	\N
c343ab9a-4837-481c-97d9-4c69d12db27e	\N	conditional-user-configured	98deb0a8-a0bc-4d66-9005-e0960be33c64	06ceef0a-ad43-4f34-a79b-f0296393f915	0	10	f	\N	\N
f73ec088-b8ee-4497-b492-0304b1fd5f59	\N	auth-otp-form	98deb0a8-a0bc-4d66-9005-e0960be33c64	06ceef0a-ad43-4f34-a79b-f0296393f915	0	20	f	\N	\N
bc76a007-e7c3-4d29-bbfa-74f1b794d5c9	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	25c211c7-72a9-4185-9e80-6fd78e1b3658	2	26	t	31131bf7-c540-4069-a2ee-fbbcce50b5ac	\N
16118a47-cd1c-4e44-abb5-038349e844a1	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	31131bf7-c540-4069-a2ee-fbbcce50b5ac	1	10	t	d3ec424f-a7a4-4574-a3e4-d00b53a00d8d	\N
7da121ca-2590-4336-af46-9ae8ced0d103	\N	conditional-user-configured	98deb0a8-a0bc-4d66-9005-e0960be33c64	d3ec424f-a7a4-4574-a3e4-d00b53a00d8d	0	10	f	\N	\N
0c04cf03-92ea-44d9-b5b2-98e6154227d9	\N	organization	98deb0a8-a0bc-4d66-9005-e0960be33c64	d3ec424f-a7a4-4574-a3e4-d00b53a00d8d	2	20	f	\N	\N
d2fb05ac-11ee-48d7-b718-64ffc15ef1f2	\N	direct-grant-validate-username	98deb0a8-a0bc-4d66-9005-e0960be33c64	1883a086-83ca-467b-bcce-54cc1ac922f0	0	10	f	\N	\N
31a50f1f-e693-4c3e-b012-9bd7cf85f81d	\N	direct-grant-validate-password	98deb0a8-a0bc-4d66-9005-e0960be33c64	1883a086-83ca-467b-bcce-54cc1ac922f0	0	20	f	\N	\N
f877f668-c42a-4b78-86d2-f6f4f491510d	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	1883a086-83ca-467b-bcce-54cc1ac922f0	1	30	t	a84bd639-1056-491a-a133-c00ea5a1ae41	\N
1ad73d2b-69c3-4663-b376-a2cd17882471	\N	conditional-user-configured	98deb0a8-a0bc-4d66-9005-e0960be33c64	a84bd639-1056-491a-a133-c00ea5a1ae41	0	10	f	\N	\N
8a8913f7-6fbb-4b63-a94d-2530d4944010	\N	direct-grant-validate-otp	98deb0a8-a0bc-4d66-9005-e0960be33c64	a84bd639-1056-491a-a133-c00ea5a1ae41	0	20	f	\N	\N
61f82e8e-5bc1-4615-9ca4-5f2d39970c8a	\N	registration-page-form	98deb0a8-a0bc-4d66-9005-e0960be33c64	9eb62d75-be34-4a10-a919-671cbfa6e369	0	10	t	d85aa1e0-3fa6-43f9-b4b3-48deb6ca8460	\N
3cc2fcee-7784-4e02-8b50-74d7c3b82c56	\N	registration-user-creation	98deb0a8-a0bc-4d66-9005-e0960be33c64	d85aa1e0-3fa6-43f9-b4b3-48deb6ca8460	0	20	f	\N	\N
9f9b96f4-4d62-451e-ada7-31a744938c98	\N	registration-password-action	98deb0a8-a0bc-4d66-9005-e0960be33c64	d85aa1e0-3fa6-43f9-b4b3-48deb6ca8460	0	50	f	\N	\N
5bbfd50d-66e6-453b-b39d-ffeef762e0b0	\N	registration-recaptcha-action	98deb0a8-a0bc-4d66-9005-e0960be33c64	d85aa1e0-3fa6-43f9-b4b3-48deb6ca8460	3	60	f	\N	\N
e87c1ad7-b5bc-48e6-8cb6-8a90bc9a88cc	\N	registration-terms-and-conditions	98deb0a8-a0bc-4d66-9005-e0960be33c64	d85aa1e0-3fa6-43f9-b4b3-48deb6ca8460	3	70	f	\N	\N
44dc0dda-cc7b-4ac5-a0b6-924ac7a470eb	\N	reset-credentials-choose-user	98deb0a8-a0bc-4d66-9005-e0960be33c64	54e8c98c-220e-4e3b-80d8-40970f11fa92	0	10	f	\N	\N
90905416-5944-4dd9-82a8-ab7e50080755	\N	reset-credential-email	98deb0a8-a0bc-4d66-9005-e0960be33c64	54e8c98c-220e-4e3b-80d8-40970f11fa92	0	20	f	\N	\N
af0c3440-d955-4a15-b4ff-72b3b99e2e2d	\N	reset-password	98deb0a8-a0bc-4d66-9005-e0960be33c64	54e8c98c-220e-4e3b-80d8-40970f11fa92	0	30	f	\N	\N
71245c17-bd0f-47ca-adda-a3b40bef2bd1	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	54e8c98c-220e-4e3b-80d8-40970f11fa92	1	40	t	3321dbc2-da98-4b6e-ae48-9cfbad9b5dfa	\N
37619dc6-4578-4070-bba9-a8b9099ee788	\N	conditional-user-configured	98deb0a8-a0bc-4d66-9005-e0960be33c64	3321dbc2-da98-4b6e-ae48-9cfbad9b5dfa	0	10	f	\N	\N
5b7811fa-b9f7-4cb4-b561-42fea002eda0	\N	reset-otp	98deb0a8-a0bc-4d66-9005-e0960be33c64	3321dbc2-da98-4b6e-ae48-9cfbad9b5dfa	0	20	f	\N	\N
ac3a0dc1-950e-4f93-b099-84c5a0253065	\N	client-secret	98deb0a8-a0bc-4d66-9005-e0960be33c64	abba2de3-bcc4-4376-a4cc-30dcf1d77847	2	10	f	\N	\N
91787b00-44fd-4408-9c97-27db4576fc22	\N	client-jwt	98deb0a8-a0bc-4d66-9005-e0960be33c64	abba2de3-bcc4-4376-a4cc-30dcf1d77847	2	20	f	\N	\N
360a7551-dfa3-467b-b194-2052fabfee19	\N	client-secret-jwt	98deb0a8-a0bc-4d66-9005-e0960be33c64	abba2de3-bcc4-4376-a4cc-30dcf1d77847	2	30	f	\N	\N
5105e2d6-5328-4a12-8acf-f0b0e9d22454	\N	client-x509	98deb0a8-a0bc-4d66-9005-e0960be33c64	abba2de3-bcc4-4376-a4cc-30dcf1d77847	2	40	f	\N	\N
8f018b2e-e309-4c6f-b551-dea41b112e83	\N	idp-review-profile	98deb0a8-a0bc-4d66-9005-e0960be33c64	86d0ac47-a36f-4a86-a3ca-3633e3b64e82	0	10	f	\N	56375632-1962-4746-b579-2436ade55c10
cb9749a1-d349-4cdd-af4c-795e504c3a6f	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	86d0ac47-a36f-4a86-a3ca-3633e3b64e82	0	20	t	cfc05759-7790-427f-8ed9-3c2889c042bd	\N
79a6cd92-7880-4a9e-864d-ab27d21ba4d7	\N	idp-create-user-if-unique	98deb0a8-a0bc-4d66-9005-e0960be33c64	cfc05759-7790-427f-8ed9-3c2889c042bd	2	10	f	\N	a974d533-b998-41c5-8a10-030bf1f132e8
356256d7-30a9-4af3-89e8-c4cf87c6635e	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	cfc05759-7790-427f-8ed9-3c2889c042bd	2	20	t	d899dce1-7fd6-46c4-ad49-b9ae0eef0e20	\N
9593f6e9-2346-4f76-8076-6756ae594b26	\N	idp-confirm-link	98deb0a8-a0bc-4d66-9005-e0960be33c64	d899dce1-7fd6-46c4-ad49-b9ae0eef0e20	0	10	f	\N	\N
02b8e29e-5f55-4f20-832c-90720d43d344	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	d899dce1-7fd6-46c4-ad49-b9ae0eef0e20	0	20	t	e92fe548-e782-4f07-9ee3-9e0f26d9a27d	\N
b8a74d62-fc85-429b-a1ef-f8ab046091a4	\N	idp-email-verification	98deb0a8-a0bc-4d66-9005-e0960be33c64	e92fe548-e782-4f07-9ee3-9e0f26d9a27d	2	10	f	\N	\N
c7e0dc75-b356-4c92-ad23-122f08f62c17	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	e92fe548-e782-4f07-9ee3-9e0f26d9a27d	2	20	t	31856305-88a3-4ede-9454-3be6b0a34e75	\N
ae58d41f-4acf-475f-8499-76cc4f179eec	\N	idp-username-password-form	98deb0a8-a0bc-4d66-9005-e0960be33c64	31856305-88a3-4ede-9454-3be6b0a34e75	0	10	f	\N	\N
14b9f1ab-6fe9-4dd9-af82-900e092619d1	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	31856305-88a3-4ede-9454-3be6b0a34e75	1	20	t	eb534130-ef98-4684-bbea-281e5a882f0e	\N
2a803843-12ea-41c4-93a0-00746d6e8802	\N	conditional-user-configured	98deb0a8-a0bc-4d66-9005-e0960be33c64	eb534130-ef98-4684-bbea-281e5a882f0e	0	10	f	\N	\N
08fd5688-d70d-4a89-8bbf-116ba6deed40	\N	auth-otp-form	98deb0a8-a0bc-4d66-9005-e0960be33c64	eb534130-ef98-4684-bbea-281e5a882f0e	0	20	f	\N	\N
d263d63d-1921-481b-aea6-c6a3fb82b406	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	86d0ac47-a36f-4a86-a3ca-3633e3b64e82	1	50	t	368d6fcf-68a3-4993-bffd-9ebd83b61e2b	\N
3720ab1a-a418-40bb-8530-c5b8a34f9c3b	\N	conditional-user-configured	98deb0a8-a0bc-4d66-9005-e0960be33c64	368d6fcf-68a3-4993-bffd-9ebd83b61e2b	0	10	f	\N	\N
5e215cfe-3aac-42b5-8c8d-c560a5de420a	\N	idp-add-organization-member	98deb0a8-a0bc-4d66-9005-e0960be33c64	368d6fcf-68a3-4993-bffd-9ebd83b61e2b	0	20	f	\N	\N
332492a7-dbe0-48d8-b03b-0b2fbce95ee2	\N	http-basic-authenticator	98deb0a8-a0bc-4d66-9005-e0960be33c64	28390a67-8256-479a-9dc4-7a6d360e7e06	0	10	f	\N	\N
53b742f0-d766-4557-9379-45f33c11a760	\N	docker-http-basic-authenticator	98deb0a8-a0bc-4d66-9005-e0960be33c64	f2dfbfd1-fb95-4a25-a6c1-bbaefc44a463	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
92aa0893-d983-4ce7-bb95-f477bf502755	browser	Browser based authentication	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	t	t
c6395fa4-cb42-4c58-89b9-4ae98235a0a6	forms	Username, password, otp and other auth forms.	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
b6ab7f1e-16e1-491a-b704-ba65379b98d5	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
24a83ae9-52cd-4bab-8d85-e8dbc0c6ba10	direct grant	OpenID Connect Resource Owner Grant	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	t	t
b4977d8b-7aa9-42b8-b26e-7230184165b5	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
e5f64655-8f5e-41cf-86ab-62a81cf5857a	registration	Registration flow	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	t	t
93ef3672-9618-4a38-a98a-2d9e512421b2	registration form	Registration form	1c48905a-b826-47d5-8c26-a03f5a248c68	form-flow	f	t
41b0b013-4d02-4b3d-a916-f26a91ee7222	reset credentials	Reset credentials for a user if they forgot their password or something	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	t	t
d6774298-23ed-43c8-9ddf-f947af6e41f0	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
db0ba350-e259-467d-be57-1c60cb213f8f	clients	Base authentication for clients	1c48905a-b826-47d5-8c26-a03f5a248c68	client-flow	t	t
c653811b-3d31-4416-9025-1b7c4cb3acbb	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	t	t
1927fa50-bedd-4aae-a837-bb7c36db8dda	User creation or linking	Flow for the existing/non-existing user alternatives	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
ae13f0a1-381c-4e1e-a027-272781a4b0d1	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
4c6ac8c3-d2a7-431c-951b-55a3609cb393	Account verification options	Method with which to verity the existing account	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
1165a20a-36da-4900-9b1b-32ca6839297f	Verify Existing Account by Re-authentication	Reauthentication of existing account	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
ce64a29f-dbec-4c61-897e-09af7f694fff	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	f	t
ce74ccbf-ede4-4dfd-b332-7ca0aa98ff70	saml ecp	SAML ECP Profile Authentication Flow	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	t	t
3a183477-cd0f-4fa9-93ed-66248dc89735	docker auth	Used by Docker clients to authenticate against the IDP	1c48905a-b826-47d5-8c26-a03f5a248c68	basic-flow	t	t
25c211c7-72a9-4185-9e80-6fd78e1b3658	browser	Browser based authentication	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	t	t
a767fc24-11d9-4871-971b-870f7d60d5ec	forms	Username, password, otp and other auth forms.	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
06ceef0a-ad43-4f34-a79b-f0296393f915	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
31131bf7-c540-4069-a2ee-fbbcce50b5ac	Organization	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
d3ec424f-a7a4-4574-a3e4-d00b53a00d8d	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
1883a086-83ca-467b-bcce-54cc1ac922f0	direct grant	OpenID Connect Resource Owner Grant	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	t	t
a84bd639-1056-491a-a133-c00ea5a1ae41	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
9eb62d75-be34-4a10-a919-671cbfa6e369	registration	Registration flow	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	t	t
d85aa1e0-3fa6-43f9-b4b3-48deb6ca8460	registration form	Registration form	98deb0a8-a0bc-4d66-9005-e0960be33c64	form-flow	f	t
54e8c98c-220e-4e3b-80d8-40970f11fa92	reset credentials	Reset credentials for a user if they forgot their password or something	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	t	t
3321dbc2-da98-4b6e-ae48-9cfbad9b5dfa	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
abba2de3-bcc4-4376-a4cc-30dcf1d77847	clients	Base authentication for clients	98deb0a8-a0bc-4d66-9005-e0960be33c64	client-flow	t	t
86d0ac47-a36f-4a86-a3ca-3633e3b64e82	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	t	t
cfc05759-7790-427f-8ed9-3c2889c042bd	User creation or linking	Flow for the existing/non-existing user alternatives	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
d899dce1-7fd6-46c4-ad49-b9ae0eef0e20	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
e92fe548-e782-4f07-9ee3-9e0f26d9a27d	Account verification options	Method with which to verity the existing account	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
31856305-88a3-4ede-9454-3be6b0a34e75	Verify Existing Account by Re-authentication	Reauthentication of existing account	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
eb534130-ef98-4684-bbea-281e5a882f0e	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
368d6fcf-68a3-4993-bffd-9ebd83b61e2b	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	f	t
28390a67-8256-479a-9dc4-7a6d360e7e06	saml ecp	SAML ECP Profile Authentication Flow	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	t	t
f2dfbfd1-fb95-4a25-a6c1-bbaefc44a463	docker auth	Used by Docker clients to authenticate against the IDP	98deb0a8-a0bc-4d66-9005-e0960be33c64	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
d82bc2c4-be3a-4b75-9640-a4fe0e428d3e	review profile config	1c48905a-b826-47d5-8c26-a03f5a248c68
88823cd5-a353-47b0-b2b2-e986e89551c4	create unique user config	1c48905a-b826-47d5-8c26-a03f5a248c68
56375632-1962-4746-b579-2436ade55c10	review profile config	98deb0a8-a0bc-4d66-9005-e0960be33c64
a974d533-b998-41c5-8a10-030bf1f132e8	create unique user config	98deb0a8-a0bc-4d66-9005-e0960be33c64
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
88823cd5-a353-47b0-b2b2-e986e89551c4	false	require.password.update.after.registration
d82bc2c4-be3a-4b75-9640-a4fe0e428d3e	missing	update.profile.on.first.login
56375632-1962-4746-b579-2436ade55c10	missing	update.profile.on.first.login
a974d533-b998-41c5-8a10-030bf1f132e8	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	f	master-realm	0	f	\N	\N	t	\N	f	1c48905a-b826-47d5-8c26-a03f5a248c68	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	1c48905a-b826-47d5-8c26-a03f5a248c68	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	1c48905a-b826-47d5-8c26-a03f5a248c68	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a712f7e5-0901-489c-82c7-7f88b7fa5e42	t	f	broker	0	f	\N	\N	t	\N	f	1c48905a-b826-47d5-8c26-a03f5a248c68	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
73329852-97b5-4c69-b546-a331a596c306	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	1c48905a-b826-47d5-8c26-a03f5a248c68	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
47d875b0-565f-4076-8f15-618e2d5712fc	t	t	admin-cli	0	t	\N	\N	f	\N	f	1c48905a-b826-47d5-8c26-a03f5a248c68	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	f	KAIST-realm	0	f	\N	\N	t	\N	f	1c48905a-b826-47d5-8c26-a03f5a248c68	\N	0	f	f	KAIST Realm	f	client-secret	\N	\N	\N	t	f	f	f
1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	f	realm-management	0	f	\N	\N	t	\N	f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
50ad5921-986f-4afb-ae73-e5e652a3de8d	t	f	account	0	t	\N	/realms/KAIST/account/	f	\N	f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3c69f671-c1f7-4a18-9fe3-b3401476c57e	t	f	account-console	0	t	\N	/realms/KAIST/account/	f	\N	f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
4e6a4fd2-6f90-44be-b941-d3741cda76ac	t	f	broker	0	f	\N	\N	t	\N	f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
fec5f95f-dd42-44f1-a854-96e37b0f7653	t	t	security-admin-console	0	t	\N	/admin/KAIST/console/	f	\N	f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
260da77b-606f-4f0b-afad-1b8f4f6d922a	t	t	admin-cli	0	t	\N	\N	f	\N	f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	t	t	Jupyter	0	f	RI4v9ELtfatw53wJ5Wmgmrethmw6E4VJ		f		f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	-1	t	f	Jupyter	t	client-secret		JupyterHub Client	\N	t	f	t	f
ff26ec34-886e-4d94-904c-0282b67a4cc4	t	t	KAIST-contest	0	f	OXEj8b650m9r88b1Dg58iiuwlz8YzpmE		f		f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	-1	t	f	KAIST-contest	t	client-secret		KAIST-contest	\N	t	f	t	f
53669ecc-a88d-4ee6-9aea-7f774c824f0d	t	t	CME	0	f	Mutyxm3WD6Yw9nA4mjqSNKmQ53e7WWZQ		f		f	98deb0a8-a0bc-4d66-9005-e0960be33c64	openid-connect	-1	t	f	CME	f	client-secret		CME	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	post.logout.redirect.uris	+
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	post.logout.redirect.uris	+
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	pkce.code.challenge.method	S256
73329852-97b5-4c69-b546-a331a596c306	post.logout.redirect.uris	+
73329852-97b5-4c69-b546-a331a596c306	pkce.code.challenge.method	S256
73329852-97b5-4c69-b546-a331a596c306	client.use.lightweight.access.token.enabled	true
47d875b0-565f-4076-8f15-618e2d5712fc	client.use.lightweight.access.token.enabled	true
50ad5921-986f-4afb-ae73-e5e652a3de8d	post.logout.redirect.uris	+
3c69f671-c1f7-4a18-9fe3-b3401476c57e	post.logout.redirect.uris	+
3c69f671-c1f7-4a18-9fe3-b3401476c57e	pkce.code.challenge.method	S256
fec5f95f-dd42-44f1-a854-96e37b0f7653	post.logout.redirect.uris	+
fec5f95f-dd42-44f1-a854-96e37b0f7653	pkce.code.challenge.method	S256
fec5f95f-dd42-44f1-a854-96e37b0f7653	client.use.lightweight.access.token.enabled	true
260da77b-606f-4f0b-afad-1b8f4f6d922a	client.use.lightweight.access.token.enabled	true
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	client.secret.creation.time	1750317716
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	standard.token.exchange.enabled	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	oauth2.device.authorization.grant.enabled	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	oidc.ciba.grant.enabled	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	post.logout.redirect.uris	*
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	backchannel.logout.session.required	true
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	backchannel.logout.revoke.offline.tokens	false
ff26ec34-886e-4d94-904c-0282b67a4cc4	client.secret.creation.time	1750317740
ff26ec34-886e-4d94-904c-0282b67a4cc4	standard.token.exchange.enabled	false
ff26ec34-886e-4d94-904c-0282b67a4cc4	oauth2.device.authorization.grant.enabled	false
ff26ec34-886e-4d94-904c-0282b67a4cc4	oidc.ciba.grant.enabled	false
ff26ec34-886e-4d94-904c-0282b67a4cc4	post.logout.redirect.uris	*
ff26ec34-886e-4d94-904c-0282b67a4cc4	backchannel.logout.session.required	true
ff26ec34-886e-4d94-904c-0282b67a4cc4	backchannel.logout.revoke.offline.tokens	false
53669ecc-a88d-4ee6-9aea-7f774c824f0d	client.secret.creation.time	1750897453
53669ecc-a88d-4ee6-9aea-7f774c824f0d	standard.token.exchange.enabled	false
53669ecc-a88d-4ee6-9aea-7f774c824f0d	oauth2.device.authorization.grant.enabled	false
53669ecc-a88d-4ee6-9aea-7f774c824f0d	oidc.ciba.grant.enabled	false
53669ecc-a88d-4ee6-9aea-7f774c824f0d	backchannel.logout.session.required	true
53669ecc-a88d-4ee6-9aea-7f774c824f0d	backchannel.logout.revoke.offline.tokens	false
53669ecc-a88d-4ee6-9aea-7f774c824f0d	realm_client	false
53669ecc-a88d-4ee6-9aea-7f774c824f0d	display.on.consent.screen	false
53669ecc-a88d-4ee6-9aea-7f774c824f0d	frontchannel.logout.session.required	true
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	realm_client	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	display.on.consent.screen	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	frontchannel.logout.session.required	true
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	access.token.header.type.rfc9068	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	request.object.signature.alg	any
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	request.object.encryption.alg	any
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	request.object.encryption.enc	any
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	request.object.required	not required
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	use.refresh.tokens	true
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	client_credentials.use_refresh_token	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	token.response.type.bearer.lower-case	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	tls.client.certificate.bound.access.tokens	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	require.pushed.authorization.requests	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	client.use.lightweight.access.token.enabled	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	client.introspection.response.allow.jwt.claim.enabled	false
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	acr.loa.map	{}
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	offline_access	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect built-in scope: offline_access	openid-connect
ba7c175a-ac34-4ad2-9114-04113c3ad176	role_list	1c48905a-b826-47d5-8c26-a03f5a248c68	SAML role list	saml
265e8814-214f-4995-ba2b-963b0cbe3436	saml_organization	1c48905a-b826-47d5-8c26-a03f5a248c68	Organization Membership	saml
b13501b1-cf3b-420d-8f1d-fbba2fd50221	profile	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect built-in scope: profile	openid-connect
def6a430-0aca-44b7-af7e-7957e815a8cb	email	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect built-in scope: email	openid-connect
248380a2-9015-4dcf-9f18-807ada136213	address	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect built-in scope: address	openid-connect
eecdd1b9-366c-4a1f-996b-6c98df525ac3	phone	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect built-in scope: phone	openid-connect
a3f88191-1ad2-43b7-bc62-fd2904e862f5	roles	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect scope for add user roles to the access token	openid-connect
bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	web-origins	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect scope for add allowed web origins to the access token	openid-connect
4e8cff58-e7df-4ab6-af1f-fc029dec2889	microprofile-jwt	1c48905a-b826-47d5-8c26-a03f5a248c68	Microprofile - JWT built-in scope	openid-connect
e1836b1b-decc-4c4b-889d-d08cd825c5ee	acr	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	basic	1c48905a-b826-47d5-8c26-a03f5a248c68	OpenID Connect scope for add all basic claims to the token	openid-connect
be7c56b8-4fe2-4681-a3b7-e37d1b0b0317	service_account	1c48905a-b826-47d5-8c26-a03f5a248c68	Specific scope for a client enabled for service accounts	openid-connect
ada5f296-7a5a-4f80-b839-25e1063155ea	organization	1c48905a-b826-47d5-8c26-a03f5a248c68	Additional claims about the organization a subject belongs to	openid-connect
353f32af-3fea-4ea3-840e-f51d67620d47	offline_access	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect built-in scope: offline_access	openid-connect
dfe1f3fe-2a77-47e9-b551-8bb3c833579e	role_list	98deb0a8-a0bc-4d66-9005-e0960be33c64	SAML role list	saml
40b4bb43-e046-4f79-8cf7-d4de210cd844	saml_organization	98deb0a8-a0bc-4d66-9005-e0960be33c64	Organization Membership	saml
b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	profile	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect built-in scope: profile	openid-connect
17ca2a77-61c1-4e6b-b33c-dcef39419bd8	email	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect built-in scope: email	openid-connect
c2ebd575-9497-4987-b5cc-62328a68b40f	address	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect built-in scope: address	openid-connect
ef5e62ae-487b-4e42-8788-878b8ab60bd8	phone	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect built-in scope: phone	openid-connect
4a89fcaf-6f02-486b-a6ef-933e7d2bd034	roles	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect scope for add user roles to the access token	openid-connect
e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	web-origins	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect scope for add allowed web origins to the access token	openid-connect
5040846b-e2aa-4623-bf8c-ad9f74c3dd78	microprofile-jwt	98deb0a8-a0bc-4d66-9005-e0960be33c64	Microprofile - JWT built-in scope	openid-connect
539a55bc-a41f-4f99-aa61-238efd8dafaa	acr	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
2e23b5a1-79df-47ef-a87f-31026eb67719	basic	98deb0a8-a0bc-4d66-9005-e0960be33c64	OpenID Connect scope for add all basic claims to the token	openid-connect
635ea8bc-6de5-47f2-9967-897903156c80	service_account	98deb0a8-a0bc-4d66-9005-e0960be33c64	Specific scope for a client enabled for service accounts	openid-connect
07632233-3098-443a-a651-07706c649104	organization	98deb0a8-a0bc-4d66-9005-e0960be33c64	Additional claims about the organization a subject belongs to	openid-connect
a3ac19af-575c-4dd0-9d3d-7d40b960c599	groups	98deb0a8-a0bc-4d66-9005-e0960be33c64		openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	true	display.on.consent.screen
6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	${offlineAccessScopeConsentText}	consent.screen.text
ba7c175a-ac34-4ad2-9114-04113c3ad176	true	display.on.consent.screen
ba7c175a-ac34-4ad2-9114-04113c3ad176	${samlRoleListScopeConsentText}	consent.screen.text
265e8814-214f-4995-ba2b-963b0cbe3436	false	display.on.consent.screen
b13501b1-cf3b-420d-8f1d-fbba2fd50221	true	display.on.consent.screen
b13501b1-cf3b-420d-8f1d-fbba2fd50221	${profileScopeConsentText}	consent.screen.text
b13501b1-cf3b-420d-8f1d-fbba2fd50221	true	include.in.token.scope
def6a430-0aca-44b7-af7e-7957e815a8cb	true	display.on.consent.screen
def6a430-0aca-44b7-af7e-7957e815a8cb	${emailScopeConsentText}	consent.screen.text
def6a430-0aca-44b7-af7e-7957e815a8cb	true	include.in.token.scope
248380a2-9015-4dcf-9f18-807ada136213	true	display.on.consent.screen
248380a2-9015-4dcf-9f18-807ada136213	${addressScopeConsentText}	consent.screen.text
248380a2-9015-4dcf-9f18-807ada136213	true	include.in.token.scope
eecdd1b9-366c-4a1f-996b-6c98df525ac3	true	display.on.consent.screen
eecdd1b9-366c-4a1f-996b-6c98df525ac3	${phoneScopeConsentText}	consent.screen.text
eecdd1b9-366c-4a1f-996b-6c98df525ac3	true	include.in.token.scope
a3f88191-1ad2-43b7-bc62-fd2904e862f5	true	display.on.consent.screen
a3f88191-1ad2-43b7-bc62-fd2904e862f5	${rolesScopeConsentText}	consent.screen.text
a3f88191-1ad2-43b7-bc62-fd2904e862f5	false	include.in.token.scope
bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	false	display.on.consent.screen
bf28d1b3-0ef3-4091-9b60-85b0ef2782cd		consent.screen.text
bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	false	include.in.token.scope
4e8cff58-e7df-4ab6-af1f-fc029dec2889	false	display.on.consent.screen
4e8cff58-e7df-4ab6-af1f-fc029dec2889	true	include.in.token.scope
e1836b1b-decc-4c4b-889d-d08cd825c5ee	false	display.on.consent.screen
e1836b1b-decc-4c4b-889d-d08cd825c5ee	false	include.in.token.scope
4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	false	display.on.consent.screen
4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	false	include.in.token.scope
be7c56b8-4fe2-4681-a3b7-e37d1b0b0317	false	display.on.consent.screen
be7c56b8-4fe2-4681-a3b7-e37d1b0b0317	false	include.in.token.scope
ada5f296-7a5a-4f80-b839-25e1063155ea	true	display.on.consent.screen
ada5f296-7a5a-4f80-b839-25e1063155ea	${organizationScopeConsentText}	consent.screen.text
ada5f296-7a5a-4f80-b839-25e1063155ea	true	include.in.token.scope
353f32af-3fea-4ea3-840e-f51d67620d47	true	display.on.consent.screen
353f32af-3fea-4ea3-840e-f51d67620d47	${offlineAccessScopeConsentText}	consent.screen.text
dfe1f3fe-2a77-47e9-b551-8bb3c833579e	true	display.on.consent.screen
dfe1f3fe-2a77-47e9-b551-8bb3c833579e	${samlRoleListScopeConsentText}	consent.screen.text
40b4bb43-e046-4f79-8cf7-d4de210cd844	false	display.on.consent.screen
b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	true	display.on.consent.screen
b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	${profileScopeConsentText}	consent.screen.text
b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	true	include.in.token.scope
17ca2a77-61c1-4e6b-b33c-dcef39419bd8	true	display.on.consent.screen
17ca2a77-61c1-4e6b-b33c-dcef39419bd8	${emailScopeConsentText}	consent.screen.text
17ca2a77-61c1-4e6b-b33c-dcef39419bd8	true	include.in.token.scope
c2ebd575-9497-4987-b5cc-62328a68b40f	true	display.on.consent.screen
c2ebd575-9497-4987-b5cc-62328a68b40f	${addressScopeConsentText}	consent.screen.text
c2ebd575-9497-4987-b5cc-62328a68b40f	true	include.in.token.scope
ef5e62ae-487b-4e42-8788-878b8ab60bd8	true	display.on.consent.screen
ef5e62ae-487b-4e42-8788-878b8ab60bd8	${phoneScopeConsentText}	consent.screen.text
ef5e62ae-487b-4e42-8788-878b8ab60bd8	true	include.in.token.scope
4a89fcaf-6f02-486b-a6ef-933e7d2bd034	true	display.on.consent.screen
4a89fcaf-6f02-486b-a6ef-933e7d2bd034	${rolesScopeConsentText}	consent.screen.text
4a89fcaf-6f02-486b-a6ef-933e7d2bd034	false	include.in.token.scope
e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	false	display.on.consent.screen
e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7		consent.screen.text
e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	false	include.in.token.scope
5040846b-e2aa-4623-bf8c-ad9f74c3dd78	false	display.on.consent.screen
5040846b-e2aa-4623-bf8c-ad9f74c3dd78	true	include.in.token.scope
539a55bc-a41f-4f99-aa61-238efd8dafaa	false	display.on.consent.screen
539a55bc-a41f-4f99-aa61-238efd8dafaa	false	include.in.token.scope
2e23b5a1-79df-47ef-a87f-31026eb67719	false	display.on.consent.screen
2e23b5a1-79df-47ef-a87f-31026eb67719	false	include.in.token.scope
635ea8bc-6de5-47f2-9967-897903156c80	false	display.on.consent.screen
635ea8bc-6de5-47f2-9967-897903156c80	false	include.in.token.scope
07632233-3098-443a-a651-07706c649104	true	display.on.consent.screen
07632233-3098-443a-a651-07706c649104	${organizationScopeConsentText}	consent.screen.text
07632233-3098-443a-a651-07706c649104	true	include.in.token.scope
a3ac19af-575c-4dd0-9d3d-7d40b960c599	true	display.on.consent.screen
a3ac19af-575c-4dd0-9d3d-7d40b960c599		consent.screen.text
a3ac19af-575c-4dd0-9d3d-7d40b960c599	true	include.in.token.scope
a3ac19af-575c-4dd0-9d3d-7d40b960c599		gui.order
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	t
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	def6a430-0aca-44b7-af7e-7957e815a8cb	t
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	a3f88191-1ad2-43b7-bc62-fd2904e862f5	t
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	t
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	e1836b1b-decc-4c4b-889d-d08cd825c5ee	t
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	b13501b1-cf3b-420d-8f1d-fbba2fd50221	t
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	248380a2-9015-4dcf-9f18-807ada136213	f
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	ada5f296-7a5a-4f80-b839-25e1063155ea	f
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	eecdd1b9-366c-4a1f-996b-6c98df525ac3	f
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	f
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	4e8cff58-e7df-4ab6-af1f-fc029dec2889	f
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	t
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	def6a430-0aca-44b7-af7e-7957e815a8cb	t
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	a3f88191-1ad2-43b7-bc62-fd2904e862f5	t
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	t
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	e1836b1b-decc-4c4b-889d-d08cd825c5ee	t
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	b13501b1-cf3b-420d-8f1d-fbba2fd50221	t
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	248380a2-9015-4dcf-9f18-807ada136213	f
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	ada5f296-7a5a-4f80-b839-25e1063155ea	f
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	eecdd1b9-366c-4a1f-996b-6c98df525ac3	f
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	f
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	4e8cff58-e7df-4ab6-af1f-fc029dec2889	f
47d875b0-565f-4076-8f15-618e2d5712fc	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	t
47d875b0-565f-4076-8f15-618e2d5712fc	def6a430-0aca-44b7-af7e-7957e815a8cb	t
47d875b0-565f-4076-8f15-618e2d5712fc	a3f88191-1ad2-43b7-bc62-fd2904e862f5	t
47d875b0-565f-4076-8f15-618e2d5712fc	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	t
47d875b0-565f-4076-8f15-618e2d5712fc	e1836b1b-decc-4c4b-889d-d08cd825c5ee	t
47d875b0-565f-4076-8f15-618e2d5712fc	b13501b1-cf3b-420d-8f1d-fbba2fd50221	t
47d875b0-565f-4076-8f15-618e2d5712fc	248380a2-9015-4dcf-9f18-807ada136213	f
47d875b0-565f-4076-8f15-618e2d5712fc	ada5f296-7a5a-4f80-b839-25e1063155ea	f
47d875b0-565f-4076-8f15-618e2d5712fc	eecdd1b9-366c-4a1f-996b-6c98df525ac3	f
47d875b0-565f-4076-8f15-618e2d5712fc	6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	f
47d875b0-565f-4076-8f15-618e2d5712fc	4e8cff58-e7df-4ab6-af1f-fc029dec2889	f
a712f7e5-0901-489c-82c7-7f88b7fa5e42	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	t
a712f7e5-0901-489c-82c7-7f88b7fa5e42	def6a430-0aca-44b7-af7e-7957e815a8cb	t
a712f7e5-0901-489c-82c7-7f88b7fa5e42	a3f88191-1ad2-43b7-bc62-fd2904e862f5	t
a712f7e5-0901-489c-82c7-7f88b7fa5e42	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	t
a712f7e5-0901-489c-82c7-7f88b7fa5e42	e1836b1b-decc-4c4b-889d-d08cd825c5ee	t
a712f7e5-0901-489c-82c7-7f88b7fa5e42	b13501b1-cf3b-420d-8f1d-fbba2fd50221	t
a712f7e5-0901-489c-82c7-7f88b7fa5e42	248380a2-9015-4dcf-9f18-807ada136213	f
a712f7e5-0901-489c-82c7-7f88b7fa5e42	ada5f296-7a5a-4f80-b839-25e1063155ea	f
a712f7e5-0901-489c-82c7-7f88b7fa5e42	eecdd1b9-366c-4a1f-996b-6c98df525ac3	f
a712f7e5-0901-489c-82c7-7f88b7fa5e42	6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	f
a712f7e5-0901-489c-82c7-7f88b7fa5e42	4e8cff58-e7df-4ab6-af1f-fc029dec2889	f
0b9a450b-01db-4cd3-a6fd-08385c9ac602	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	t
0b9a450b-01db-4cd3-a6fd-08385c9ac602	def6a430-0aca-44b7-af7e-7957e815a8cb	t
0b9a450b-01db-4cd3-a6fd-08385c9ac602	a3f88191-1ad2-43b7-bc62-fd2904e862f5	t
0b9a450b-01db-4cd3-a6fd-08385c9ac602	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	t
0b9a450b-01db-4cd3-a6fd-08385c9ac602	e1836b1b-decc-4c4b-889d-d08cd825c5ee	t
0b9a450b-01db-4cd3-a6fd-08385c9ac602	b13501b1-cf3b-420d-8f1d-fbba2fd50221	t
0b9a450b-01db-4cd3-a6fd-08385c9ac602	248380a2-9015-4dcf-9f18-807ada136213	f
0b9a450b-01db-4cd3-a6fd-08385c9ac602	ada5f296-7a5a-4f80-b839-25e1063155ea	f
0b9a450b-01db-4cd3-a6fd-08385c9ac602	eecdd1b9-366c-4a1f-996b-6c98df525ac3	f
0b9a450b-01db-4cd3-a6fd-08385c9ac602	6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	f
0b9a450b-01db-4cd3-a6fd-08385c9ac602	4e8cff58-e7df-4ab6-af1f-fc029dec2889	f
73329852-97b5-4c69-b546-a331a596c306	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	t
73329852-97b5-4c69-b546-a331a596c306	def6a430-0aca-44b7-af7e-7957e815a8cb	t
73329852-97b5-4c69-b546-a331a596c306	a3f88191-1ad2-43b7-bc62-fd2904e862f5	t
73329852-97b5-4c69-b546-a331a596c306	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	t
73329852-97b5-4c69-b546-a331a596c306	e1836b1b-decc-4c4b-889d-d08cd825c5ee	t
73329852-97b5-4c69-b546-a331a596c306	b13501b1-cf3b-420d-8f1d-fbba2fd50221	t
73329852-97b5-4c69-b546-a331a596c306	248380a2-9015-4dcf-9f18-807ada136213	f
73329852-97b5-4c69-b546-a331a596c306	ada5f296-7a5a-4f80-b839-25e1063155ea	f
73329852-97b5-4c69-b546-a331a596c306	eecdd1b9-366c-4a1f-996b-6c98df525ac3	f
73329852-97b5-4c69-b546-a331a596c306	6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	f
73329852-97b5-4c69-b546-a331a596c306	4e8cff58-e7df-4ab6-af1f-fc029dec2889	f
50ad5921-986f-4afb-ae73-e5e652a3de8d	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
50ad5921-986f-4afb-ae73-e5e652a3de8d	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
50ad5921-986f-4afb-ae73-e5e652a3de8d	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
50ad5921-986f-4afb-ae73-e5e652a3de8d	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
50ad5921-986f-4afb-ae73-e5e652a3de8d	2e23b5a1-79df-47ef-a87f-31026eb67719	t
50ad5921-986f-4afb-ae73-e5e652a3de8d	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
50ad5921-986f-4afb-ae73-e5e652a3de8d	07632233-3098-443a-a651-07706c649104	f
50ad5921-986f-4afb-ae73-e5e652a3de8d	353f32af-3fea-4ea3-840e-f51d67620d47	f
50ad5921-986f-4afb-ae73-e5e652a3de8d	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
50ad5921-986f-4afb-ae73-e5e652a3de8d	c2ebd575-9497-4987-b5cc-62328a68b40f	f
50ad5921-986f-4afb-ae73-e5e652a3de8d	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
3c69f671-c1f7-4a18-9fe3-b3401476c57e	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
3c69f671-c1f7-4a18-9fe3-b3401476c57e	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
3c69f671-c1f7-4a18-9fe3-b3401476c57e	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
3c69f671-c1f7-4a18-9fe3-b3401476c57e	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
3c69f671-c1f7-4a18-9fe3-b3401476c57e	2e23b5a1-79df-47ef-a87f-31026eb67719	t
3c69f671-c1f7-4a18-9fe3-b3401476c57e	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
3c69f671-c1f7-4a18-9fe3-b3401476c57e	07632233-3098-443a-a651-07706c649104	f
3c69f671-c1f7-4a18-9fe3-b3401476c57e	353f32af-3fea-4ea3-840e-f51d67620d47	f
3c69f671-c1f7-4a18-9fe3-b3401476c57e	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
3c69f671-c1f7-4a18-9fe3-b3401476c57e	c2ebd575-9497-4987-b5cc-62328a68b40f	f
3c69f671-c1f7-4a18-9fe3-b3401476c57e	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
260da77b-606f-4f0b-afad-1b8f4f6d922a	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
260da77b-606f-4f0b-afad-1b8f4f6d922a	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
260da77b-606f-4f0b-afad-1b8f4f6d922a	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
260da77b-606f-4f0b-afad-1b8f4f6d922a	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
260da77b-606f-4f0b-afad-1b8f4f6d922a	2e23b5a1-79df-47ef-a87f-31026eb67719	t
260da77b-606f-4f0b-afad-1b8f4f6d922a	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
260da77b-606f-4f0b-afad-1b8f4f6d922a	07632233-3098-443a-a651-07706c649104	f
260da77b-606f-4f0b-afad-1b8f4f6d922a	353f32af-3fea-4ea3-840e-f51d67620d47	f
260da77b-606f-4f0b-afad-1b8f4f6d922a	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
260da77b-606f-4f0b-afad-1b8f4f6d922a	c2ebd575-9497-4987-b5cc-62328a68b40f	f
260da77b-606f-4f0b-afad-1b8f4f6d922a	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
4e6a4fd2-6f90-44be-b941-d3741cda76ac	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
4e6a4fd2-6f90-44be-b941-d3741cda76ac	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
4e6a4fd2-6f90-44be-b941-d3741cda76ac	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
4e6a4fd2-6f90-44be-b941-d3741cda76ac	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
4e6a4fd2-6f90-44be-b941-d3741cda76ac	2e23b5a1-79df-47ef-a87f-31026eb67719	t
4e6a4fd2-6f90-44be-b941-d3741cda76ac	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
4e6a4fd2-6f90-44be-b941-d3741cda76ac	07632233-3098-443a-a651-07706c649104	f
4e6a4fd2-6f90-44be-b941-d3741cda76ac	353f32af-3fea-4ea3-840e-f51d67620d47	f
4e6a4fd2-6f90-44be-b941-d3741cda76ac	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
4e6a4fd2-6f90-44be-b941-d3741cda76ac	c2ebd575-9497-4987-b5cc-62328a68b40f	f
4e6a4fd2-6f90-44be-b941-d3741cda76ac	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
1d78f604-cf59-4a12-8688-ab8c56ea08b4	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
1d78f604-cf59-4a12-8688-ab8c56ea08b4	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
1d78f604-cf59-4a12-8688-ab8c56ea08b4	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
1d78f604-cf59-4a12-8688-ab8c56ea08b4	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
1d78f604-cf59-4a12-8688-ab8c56ea08b4	2e23b5a1-79df-47ef-a87f-31026eb67719	t
1d78f604-cf59-4a12-8688-ab8c56ea08b4	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
1d78f604-cf59-4a12-8688-ab8c56ea08b4	07632233-3098-443a-a651-07706c649104	f
1d78f604-cf59-4a12-8688-ab8c56ea08b4	353f32af-3fea-4ea3-840e-f51d67620d47	f
1d78f604-cf59-4a12-8688-ab8c56ea08b4	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
1d78f604-cf59-4a12-8688-ab8c56ea08b4	c2ebd575-9497-4987-b5cc-62328a68b40f	f
1d78f604-cf59-4a12-8688-ab8c56ea08b4	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
fec5f95f-dd42-44f1-a854-96e37b0f7653	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
fec5f95f-dd42-44f1-a854-96e37b0f7653	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
fec5f95f-dd42-44f1-a854-96e37b0f7653	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
fec5f95f-dd42-44f1-a854-96e37b0f7653	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
fec5f95f-dd42-44f1-a854-96e37b0f7653	2e23b5a1-79df-47ef-a87f-31026eb67719	t
fec5f95f-dd42-44f1-a854-96e37b0f7653	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
fec5f95f-dd42-44f1-a854-96e37b0f7653	07632233-3098-443a-a651-07706c649104	f
fec5f95f-dd42-44f1-a854-96e37b0f7653	353f32af-3fea-4ea3-840e-f51d67620d47	f
fec5f95f-dd42-44f1-a854-96e37b0f7653	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
fec5f95f-dd42-44f1-a854-96e37b0f7653	c2ebd575-9497-4987-b5cc-62328a68b40f	f
fec5f95f-dd42-44f1-a854-96e37b0f7653	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	2e23b5a1-79df-47ef-a87f-31026eb67719	t
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	07632233-3098-443a-a651-07706c649104	f
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	353f32af-3fea-4ea3-840e-f51d67620d47	f
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	c2ebd575-9497-4987-b5cc-62328a68b40f	f
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	635ea8bc-6de5-47f2-9967-897903156c80	t
ff26ec34-886e-4d94-904c-0282b67a4cc4	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
ff26ec34-886e-4d94-904c-0282b67a4cc4	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
ff26ec34-886e-4d94-904c-0282b67a4cc4	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
ff26ec34-886e-4d94-904c-0282b67a4cc4	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
ff26ec34-886e-4d94-904c-0282b67a4cc4	2e23b5a1-79df-47ef-a87f-31026eb67719	t
ff26ec34-886e-4d94-904c-0282b67a4cc4	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
ff26ec34-886e-4d94-904c-0282b67a4cc4	07632233-3098-443a-a651-07706c649104	f
ff26ec34-886e-4d94-904c-0282b67a4cc4	353f32af-3fea-4ea3-840e-f51d67620d47	f
ff26ec34-886e-4d94-904c-0282b67a4cc4	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
ff26ec34-886e-4d94-904c-0282b67a4cc4	c2ebd575-9497-4987-b5cc-62328a68b40f	f
ff26ec34-886e-4d94-904c-0282b67a4cc4	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
ff26ec34-886e-4d94-904c-0282b67a4cc4	635ea8bc-6de5-47f2-9967-897903156c80	t
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	a3ac19af-575c-4dd0-9d3d-7d40b960c599	t
53669ecc-a88d-4ee6-9aea-7f774c824f0d	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
53669ecc-a88d-4ee6-9aea-7f774c824f0d	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
53669ecc-a88d-4ee6-9aea-7f774c824f0d	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
53669ecc-a88d-4ee6-9aea-7f774c824f0d	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
53669ecc-a88d-4ee6-9aea-7f774c824f0d	2e23b5a1-79df-47ef-a87f-31026eb67719	t
53669ecc-a88d-4ee6-9aea-7f774c824f0d	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
53669ecc-a88d-4ee6-9aea-7f774c824f0d	07632233-3098-443a-a651-07706c649104	f
53669ecc-a88d-4ee6-9aea-7f774c824f0d	353f32af-3fea-4ea3-840e-f51d67620d47	f
53669ecc-a88d-4ee6-9aea-7f774c824f0d	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
53669ecc-a88d-4ee6-9aea-7f774c824f0d	c2ebd575-9497-4987-b5cc-62328a68b40f	f
53669ecc-a88d-4ee6-9aea-7f774c824f0d	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	e34c9786-192e-4122-b406-089332419ce1
353f32af-3fea-4ea3-840e-f51d67620d47	9bc9fbe8-8e84-45ab-a8e5-a3f68948aa79
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
2dad27bc-c809-4674-bfea-81b0174f134a	Trusted Hosts	1c48905a-b826-47d5-8c26-a03f5a248c68	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	anonymous
189735f0-4f7d-4bfe-8124-c1c2d7d8c1a6	Consent Required	1c48905a-b826-47d5-8c26-a03f5a248c68	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	anonymous
0a5b1752-9c3e-4bf4-9c4a-14bebcbb0b49	Full Scope Disabled	1c48905a-b826-47d5-8c26-a03f5a248c68	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	anonymous
3eac1263-4233-47f1-9a3a-679e8a5d01cf	Max Clients Limit	1c48905a-b826-47d5-8c26-a03f5a248c68	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	anonymous
ecf46d1d-1903-4514-8357-a1a426448452	Allowed Protocol Mapper Types	1c48905a-b826-47d5-8c26-a03f5a248c68	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	anonymous
7a88561c-74fc-4e57-9edb-4eee9490cce5	Allowed Client Scopes	1c48905a-b826-47d5-8c26-a03f5a248c68	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	anonymous
f0f09749-bf0d-4cd4-a68c-b2928c17e863	Allowed Protocol Mapper Types	1c48905a-b826-47d5-8c26-a03f5a248c68	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	authenticated
691e7dbf-879e-474f-91e1-c800c40d9c63	Allowed Client Scopes	1c48905a-b826-47d5-8c26-a03f5a248c68	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	authenticated
a18565fa-5fa5-41db-a512-93a3c9775753	rsa-generated	1c48905a-b826-47d5-8c26-a03f5a248c68	rsa-generated	org.keycloak.keys.KeyProvider	1c48905a-b826-47d5-8c26-a03f5a248c68	\N
9a80f5fd-5ade-4709-bee6-13f742f28d23	rsa-enc-generated	1c48905a-b826-47d5-8c26-a03f5a248c68	rsa-enc-generated	org.keycloak.keys.KeyProvider	1c48905a-b826-47d5-8c26-a03f5a248c68	\N
a5a0e05b-e94d-469a-8626-146848c03338	hmac-generated-hs512	1c48905a-b826-47d5-8c26-a03f5a248c68	hmac-generated	org.keycloak.keys.KeyProvider	1c48905a-b826-47d5-8c26-a03f5a248c68	\N
cd0423c7-91c4-414b-847a-8ecce2919ded	aes-generated	1c48905a-b826-47d5-8c26-a03f5a248c68	aes-generated	org.keycloak.keys.KeyProvider	1c48905a-b826-47d5-8c26-a03f5a248c68	\N
6a0399f4-e7a6-47bd-bc26-db953c7639e3	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	1c48905a-b826-47d5-8c26-a03f5a248c68	\N
8512bf0a-e668-4529-b404-1a9a552f2aa5	rsa-generated	98deb0a8-a0bc-4d66-9005-e0960be33c64	rsa-generated	org.keycloak.keys.KeyProvider	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N
e875006d-0534-481d-9bd8-5e0cda540085	rsa-enc-generated	98deb0a8-a0bc-4d66-9005-e0960be33c64	rsa-enc-generated	org.keycloak.keys.KeyProvider	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N
c749d082-6e46-448b-a0c5-31c95704acbe	hmac-generated-hs512	98deb0a8-a0bc-4d66-9005-e0960be33c64	hmac-generated	org.keycloak.keys.KeyProvider	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N
1e1a7397-3a98-4c90-84cd-e37d7955a2ec	aes-generated	98deb0a8-a0bc-4d66-9005-e0960be33c64	aes-generated	org.keycloak.keys.KeyProvider	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N
daa63e27-102b-4b42-bccc-14bd18f4565d	Trusted Hosts	98deb0a8-a0bc-4d66-9005-e0960be33c64	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	anonymous
0604dc2b-1ec0-44d5-8f73-5718e81d54b3	Consent Required	98deb0a8-a0bc-4d66-9005-e0960be33c64	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	anonymous
b2ebf680-a55e-43a2-9f72-2e2da8df66dc	Full Scope Disabled	98deb0a8-a0bc-4d66-9005-e0960be33c64	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	anonymous
4e5c32b3-839e-43cf-84ef-7bf4861d3435	Max Clients Limit	98deb0a8-a0bc-4d66-9005-e0960be33c64	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	anonymous
541f183f-dbe8-49c7-bbaa-41532cbedff2	Allowed Protocol Mapper Types	98deb0a8-a0bc-4d66-9005-e0960be33c64	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	anonymous
4dbcf22f-d6b4-4ad9-a09f-b7adce88ae52	Allowed Client Scopes	98deb0a8-a0bc-4d66-9005-e0960be33c64	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	anonymous
95654870-76ac-4bb4-af04-204493627a5f	Allowed Protocol Mapper Types	98deb0a8-a0bc-4d66-9005-e0960be33c64	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	authenticated
5598edfc-2c7e-48fc-8977-055bcbc6f31b	Allowed Client Scopes	98deb0a8-a0bc-4d66-9005-e0960be33c64	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
517c044d-ee23-4923-9720-1edb61f778a6	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	saml-role-list-mapper
ea8abc5c-2990-4172-88ce-b5a43ab7cb12	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	oidc-full-name-mapper
f2466b4d-5b0e-49d2-8747-52b9479ce766	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
840db1c7-c092-4c85-ba70-45c0cd9abb3e	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	oidc-address-mapper
33ad77f0-2c76-400f-a302-01448ecd66a2	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8bf5ab43-4fb4-4504-ab59-dcbb99a204bf	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	saml-user-property-mapper
39c3aa6f-638c-44ce-a8a9-87aa0790a777	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	saml-user-attribute-mapper
267ad308-cd2f-4d04-bd42-e1f102aa11fc	ecf46d1d-1903-4514-8357-a1a426448452	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
6c544d5d-1452-4221-9cf8-5eeb86a1ce1b	2dad27bc-c809-4674-bfea-81b0174f134a	host-sending-registration-request-must-match	true
96bb3e77-67f3-48b8-8453-b6d1ad5e15d5	2dad27bc-c809-4674-bfea-81b0174f134a	client-uris-must-match	true
6e981397-8f3a-4184-b71b-d83412fb7849	7a88561c-74fc-4e57-9edb-4eee9490cce5	allow-default-scopes	true
9dda3775-b045-4525-8daa-abaabc2b4ef7	3eac1263-4233-47f1-9a3a-679e8a5d01cf	max-clients	200
260e2ac1-46bd-45c0-8a9d-e7ab3c2050a4	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
a1db9188-9ab7-4d01-befe-f73676707c3b	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	saml-user-attribute-mapper
68885e0e-39c7-43af-84f9-dca6376e2193	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	saml-user-property-mapper
e93774e9-5a82-474e-923e-62b5e2d57f4f	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	oidc-address-mapper
05d42328-3976-46f6-99ae-e7a76f14bcd2	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	saml-role-list-mapper
b2a01e45-81b1-4261-b89c-d4a0e00ee7de	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	oidc-full-name-mapper
11a47f7f-e7d7-4571-a1c4-785cf17c585c	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
5cc41f7c-5b58-4688-9f97-9abe97b5f4dc	f0f09749-bf0d-4cd4-a68c-b2928c17e863	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
84fcc26f-7798-45f9-acfc-817768771433	691e7dbf-879e-474f-91e1-c800c40d9c63	allow-default-scopes	true
4fb467a4-6d84-4a4e-b611-10765566d519	6a0399f4-e7a6-47bd-bc26-db953c7639e3	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
a3ca1406-c88b-4c23-a08d-0f63681eab91	a18565fa-5fa5-41db-a512-93a3c9775753	privateKey	MIIEowIBAAKCAQEAoxb/5r/2XOvZ77TVOmsec5Qje7Fm/AwAtP3O9kXYwFWToakHcECJyYHYIn0BAYmCYfOHVWtacC0spQ1lav3njOhJeZvKTpnmj9BeSK4lqWAN4Xi299CRf3UiwziD74frFVDef5biSU57eU4e1TOqug3w1c8ioCr9ANDqDLUk9nf2dol89kkn3gq+wguKAbXeKXIGlaB6YQ97Dp/p1+yB9WEsCTKzmGDd6/NgEaN8O9Up0RI7m0NqAm0IATNLIot4YjScXTwgC+/EbzHwbvs0ufO3iAMPVTiWmfAwSJErGU7Ofg5PjnRjNIUwD93uS4auA3YJZAlzMmU9hTVHE8cL3wIDAQABAoIBAC7ydHjGwpMOG57apdTauBnaR3qYX0Zn6B4xv8153sLC/6v2HduM4H0ewQpwhIUeQeeTdF48+Hw5LNRYblzluS2BQoFcvNhyigHVIAb5BoNi0KwalUTyB6gynm6nCqe9rwjkTiBZXUtv6bBKMir6ZAeJ8s2Bgnyr00fUW8OLs5e1C0//04e2Kz8DK5MxocPrP3JvrFgFD5GbGy5ejxfzRymO1PAEFQAcPUpT53Kz9yMkPaWKhqMxANQ1r0RAvLB/Km3h+KpZaiS6rvZn0LFIyxb2OnkF5Sz3AkXxVymHOecqVWwBVB0cHRBJjf9LpllHK8liSoLBe88xvYiOrgW33AkCgYEA5ZKL1kNfbAwGezMV/GX3sJRmkTyTaSLS6rX00B9N0A3b+0uOh1U3Y/9LBqLJxkGYWm54rA/qWTykbZYATBmPu5vpsh6GPUhl6iIsHni5BM73qCm/gqTvYf4a9FGIC+pZRuf6RD27dwllE5+ipmeIioVKyyGij0bKQa5k58aX0kkCgYEAtd05c991tMZ01J0ypQrprzmcNbd6NuIhK1/Ng4tw8Wm6lKLzCIKf3Czd8+/I1stiA7FUQ6+/MO4UKqjAYw+wUxYCawK86II3Uab/+90s0QjoinS5PLzSZ+xho5JeuH7xV5laHCZAtLCdviF2yD2x+/9THovXaOUF/d0e+VOF7OcCgYB4yPa736yn21fZoBI0Pq3oANxKE9X3HfRcuyk4CxBUo8YW3DT8LTC8cwhVUHba0Y5IHhFtbd493zMf2SkE4PoHmkuFhJvaSGoemqYdziSCTCZvGrABG6g7JYem/fKXWlBohwrctqIYSiAdCAN6i8SCJQkqAONXgMZPcmLys0ETyQKBgDcWEk/50MJ4Fm1MTEnXm177GUjgEYHMTvW/aBW/R++n8d8R2IGsZ1WetYAtEm2VX1P1A6wY8NWWV79wLA4Vc3hHQ2Y8hxH6V11BM2qL3QZYJ2/A2Vb/btARtqWAMXa65Ml+5t996r2QfcdYhY0zutS0yu2GuDHKpVz2/GnTFc7jAoGBAKtC47i2t8EHzod2C6iMoWc0lLG6gytxkm4I8yIFnTGg/w4EOSJNPjCpWmWkeex87uOI/P57XJyAiReHxnGsYM/k+XwQB+1ypwOxYxFhrf7t+cf69a1tMKNqwXXYKJDU8Rp13CyJnjvjM/nDIUpQxvHHGIvZh9nVVFlJpPP3Gbt9
36eeeb67-e3ad-4b45-8d35-2e401edb8e22	a18565fa-5fa5-41db-a512-93a3c9775753	priority	100
711366af-8b4c-46a6-8131-3a10c3f5c28f	a18565fa-5fa5-41db-a512-93a3c9775753	certificate	MIICmzCCAYMCBgGXhws+eTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNjE5MDcxNDEwWhcNMzUwNjE5MDcxNTUwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCjFv/mv/Zc69nvtNU6ax5zlCN7sWb8DAC0/c72RdjAVZOhqQdwQInJgdgifQEBiYJh84dVa1pwLSylDWVq/eeM6El5m8pOmeaP0F5IriWpYA3heLb30JF/dSLDOIPvh+sVUN5/luJJTnt5Th7VM6q6DfDVzyKgKv0A0OoMtST2d/Z2iXz2SSfeCr7CC4oBtd4pcgaVoHphD3sOn+nX7IH1YSwJMrOYYN3r82ARo3w71SnREjubQ2oCbQgBM0sii3hiNJxdPCAL78RvMfBu+zS587eIAw9VOJaZ8DBIkSsZTs5+Dk+OdGM0hTAP3e5Lhq4DdglkCXMyZT2FNUcTxwvfAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHs/iuRaGz1d1PmsxcoeNBTPf8HF/ZC1lkkx+DLO6ha03NBLFXqI6RFaKHcjCVIr52JT9g8iURO/WK9iuMODEv9RucD1AzNOfinq4KlmxLYpJUDT4Jx1qUTqsPBSsocoqEHNJqnJ0326SZJdUO9P5TNhEwdtGJMj970/CnlpoO+jJZqhvtZTKFNJYxQcWWXIV/TfZaOOnQRzUAcKO7i42XOva6HYItAOejo5K3yV5Dhy6n/p7/EQlN5maAvoWk0XpJa2L/9XYK3zmCKRyqGplu6vOIWoqsGQ91EaDsboX8aJB1hPC7iAMkhHRl3H9ONZuAdaqBtPuEF7OYPiB+x1kbM=
f55acd88-ccd7-4ef8-8a99-a2f46fbadf82	a18565fa-5fa5-41db-a512-93a3c9775753	keyUse	SIG
e300beb5-e65f-4d28-98e9-1648e6bd2128	9a80f5fd-5ade-4709-bee6-13f742f28d23	keyUse	ENC
9064dd1c-d7cc-4e05-9cb4-54793d9c42aa	9a80f5fd-5ade-4709-bee6-13f742f28d23	privateKey	MIIEogIBAAKCAQEAptvlbTumuh1jHCzQ869DR8h+/Ox+BWM0ePTAT0IsvwSotHlq7a/SxK0Z5cCDzog6LAuBVE4G5IfjykQbRiqU/IAxJSv9SQVkgQ51Ow6T/oVVzj+ePiucITY72Dwx263b7vuqq7Mwf6neUCYB4GalbHUlo8+U1DwLGR3IAqzmf/CiGp6QILSqEE+agStgKlgXGz8Nt+uIaSfNMdn8Gt4Tb0GXYzFDqbOsfJ74sv3YvgLB0WjvRUbejQ8YIIULDRxzSasJzOsK83e2S/xeYxVYiOoTr7LNeG5OFhI8VmaqoAYvMPaChyCSJ/0gdoWRx9LtUMzzpFSCizY/aQhEr/AelQIDAQABAoIBAAl1NeYw5ySuBT/j1200njzro60M76C5DJCdmOf1MYmbRz/BkRrLaEg/IpRoCuCSTq/P8CL58ECUZkhA/4XE5KCCWKbJfUgeDuIU0nbIPwHCh4hTCVJvUOB+DTrWwKG501lSuQwV8lYOKByFZv5T+yTwZ/OG0OINzDg+fKeQKtmOD/2iIBgIWow6KM6ObvI8vye3OHYJ/mQ9sjSGcw9QMWhCFRg/iC41MpwMBBlCRsbCwx+I+4/1IOXnDukY5E7UlIqjX09bAl4KIsZFQiZGQTxo3y4cp1zKSACwjT26y7OUSk8Y7MYYc9Nqh1tLkpMM+AMq8uRl8nn6pj3JtNmMBjECgYEA2z1puLs6kd1KS3Yw+vOJjpEGlHsHJOrTVqhn/zB3sZN/a1AoWz2wlrSpuewwoOJBK4VpHfBrcVY1C+tSDXDlybOj368J3sPNWwR4vl3bM3wnf3FmF6XbmWmqdPrK+1Gkj1VAoJopHCIFzKqNh6t9pYI/6nnlYwTLYDr+zGiePsUCgYEAwtYZp/1VZFyHBUofJNGpWBzleJ3xrTumLpwBznvPKzIF2zcEQtahkQSK2TZQV777VAPffXd5N1sAGfIOP6HWd3hdwlVDyoOIvTaX6J6aVNSoAaEDisWor7+CF3OWfIrEqYf/bFJb0rjpnJ30xmk0SInLUCh/kWB4rIgyq9ONXZECgYAcpUqSA4ykkGhrsba2o2l+wj482lJVpYUVlo14D2okPqRwbhnHyiivmE1w6IZ2Dvn66MSST96KAXyO4SFodi7gCuPHj0RX4feMA+qO3Q6ODJPQmA2B23707ZSDEl3BNqqsu7PlCB+E+IEPe91gM60IGhul1GV/aZn1KeAu7yB2DQKBgB8YxOeHC4YFLpetiOL7g6fIlOd3bgdUKeXuiGtIX3xpc33Vfhyc3RSkQPUCMjiPBtYV+CmyU+p937pEY/nL/sr6rxxBN5yu+bgZao16Iu+/MUFxTXtsqMvEKSNNE4u1KkZUqnPDgVxUnxScMWEpkWqyc3zLufCeESSYaF38WefBAoGATt0artGdCIoHe/VP881VPNFGF8yxF7jau7Ls1vezHO+GGZaStb45RUHqp8dZI3/cNnBXp/9tCHPSndfEQwUR2gGp+Ja2g2hDTCgWszBwhqGotlSOvwgV7+SkOLBiYpvfqt0xX7c7IrTkSU8ll2sNsdDYLCmsJem7jxAd5a9Pb5A=
4494294b-6987-4570-8ea3-0fe1598a80fc	9a80f5fd-5ade-4709-bee6-13f742f28d23	priority	100
ca5b7994-905e-416b-9bb2-ee3b09d890a5	9a80f5fd-5ade-4709-bee6-13f742f28d23	certificate	MIICmzCCAYMCBgGXhwtBxjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNjE5MDcxNDExWhcNMzUwNjE5MDcxNTUxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCm2+VtO6a6HWMcLNDzr0NHyH787H4FYzR49MBPQiy/BKi0eWrtr9LErRnlwIPOiDosC4FUTgbkh+PKRBtGKpT8gDElK/1JBWSBDnU7DpP+hVXOP54+K5whNjvYPDHbrdvu+6qrszB/qd5QJgHgZqVsdSWjz5TUPAsZHcgCrOZ/8KIanpAgtKoQT5qBK2AqWBcbPw2364hpJ80x2fwa3hNvQZdjMUOps6x8nviy/di+AsHRaO9FRt6NDxgghQsNHHNJqwnM6wrzd7ZL/F5jFViI6hOvss14bk4WEjxWZqqgBi8w9oKHIJIn/SB2hZHH0u1QzPOkVIKLNj9pCESv8B6VAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAz9i48+sxblJwQEiAkx47yeCojOzVxFJFlx8AiZ2d22ygLJ1WB9cplmSpd2Ds/oAEpuTkc5dnG4AD5DreM7fIc1PPWPyXB+/J2ECdRXDrrNI2Z5C7sbqwckrV38372FfBi1ojVUSeUbkIImXtJGPeovXRXzCgmUtXeK6IqnUpKgHHBD/TdqbqMeOOA/qYDTATmDf6DbHosA+4nFL7eTkBh8glgLXulw/Dv++DTXnOrnJYQzZqorqGAdj00QAlIIfU1x0NdgtOowX6gnTH+lrhbrNDVq4sMGfKPDm5KYMdwXfyoEFOaRphrkI6h6ol02eXb7P8t+P1TnP0wOuUvydt8=
2020d0d1-97ff-4741-a71e-c933524f5e7a	9a80f5fd-5ade-4709-bee6-13f742f28d23	algorithm	RSA-OAEP
0452abcc-ee14-47bb-a3cb-bf718fb58b61	cd0423c7-91c4-414b-847a-8ecce2919ded	priority	100
cb95805c-0953-478c-8c5a-c03e28d85d41	cd0423c7-91c4-414b-847a-8ecce2919ded	secret	7-6XzagVMCm5lO1fj5N2ag
35f20738-219b-43a1-a143-dc9f3ff7983d	cd0423c7-91c4-414b-847a-8ecce2919ded	kid	665ea775-194e-4e93-a9ff-c97a9e6e5e21
ba723f8b-88b1-4e63-ab9e-b525c5007eca	a5a0e05b-e94d-469a-8626-146848c03338	priority	100
1295b458-371a-4fc4-9075-bf681a1e6bbe	a5a0e05b-e94d-469a-8626-146848c03338	kid	8a724b5a-ce4f-4c0c-97c7-f4bc6567fa2a
d3b0171d-6b4a-4c6f-930f-c0d9190f1985	a5a0e05b-e94d-469a-8626-146848c03338	secret	GCaUqIfbUgvw_GU7UjbZ1GVouLKSak-Ahx4xCwWTodUevg0Eiq_pYbaHU9MTIWOaBmwKY9NGM2_urdPC-oBHFjrPjNk-U3_xTm7G5uWWAj6COmEx2W-gsRlKpifh-Ps-ppvU0URACujLVCYDSD7JMPOmN6e34B5ajLruTBz_oXY
b6aa4819-3c0a-47da-b917-a281ea695a4b	a5a0e05b-e94d-469a-8626-146848c03338	algorithm	HS512
c3c5c491-8240-47fe-a3ee-18f0de564bf3	8512bf0a-e668-4529-b404-1a9a552f2aa5	privateKey	MIIEowIBAAKCAQEAxk1BH7YjuYH6NRsrxpbBB2f/kZlWujUmD3BR85/vPI10ixVC8j6xXypU+3aLgP0e2M0zpk9olrq8FfT8Dz7n8p1RKsOJ0Y/aWRVCaDnyGoISB6ZrxA5GnK4i4IkVu21oUVkWrfVugRCD/4YGEbTfjy8iF+s4vRpXI6gTCJq7EyRoUg8MxFtXk0IOBLeqzSkotGEiYIY6kCcBrc8AqHtrz00FOX6J/KKeFEtmwxJOtvwDT/tjbfZn05+N0vq31ryxG+pqA8ZJS7QEnbHldm3wAog8P9X7uGFunFJlKHEgGiEuqm/uXZEiErnvmtrZpceKLZBvlvv0g3WlwhcsdYBodQIDAQABAoIBABMBrZfGA+eQazRy3b/DjE3S7H5+lX70gCjjqZ8xuaLypfR8vbVtR9/otUuC4b0jxbSe+m/a1Zn43PU3zX8ClwW8iV6RbmC9Kn72WC6YOznKNMMx8stQWPlEgYhG62PTCTge01sqFoTdWeGAbY196h2VtW1YeNA7OZXr0qM0/XBIlkedVF98bWfVrhqzILR5P6woyVP/4zt8msmu1B4XHAutNjZ+bZ+6aTytaqT1cAlXCcnuQtCCISjGJvHzLNnUhFd5CNZBfCLEbRJWQsasLA0Eu7DlbME3z/mI53C1thRllIFuVd+ED5IMgnPB+bPf4d5RpZBR0eE9KDImPQLnqIECgYEA73gx455DhS4MqBqi8XCNXftido+UnmPyIRB3nUgWNP5xqLKcNPbm9e4erXDlerPSGaFF+3oaxmrn1ZxFXc7regf8WsPienzttYAksyoEW1kgEbKTP6oY7PDojH7ZZa5AMxDGBrGeEN0DWBwmR7HzpreiXLRr0piJbzVEA7esVcECgYEA0/2Pe6TEN90VsYoYK/Wk2pR1wbCTaq5sk+caOUKNwmi36NDzKLIFi9ygdC+XbAk7rTQywdii2j7J8sYecg4ehQV8yjhGqZveoC+c13WOaew7nOdntpa/TF5pn4pOryX6auvFMroyJt3NZNixx7GJcLpwFfFnBfpeAKj39Dkvh7UCgYBiLaAelwNNtdyAizMk06VR07/Bpgojigx6G9s+g5B/N5Z3uIqseFGmoHK5XyDmVpUb5u/fM2eI08mq3T/fPvdx95YxzD+tQkze7eOeBOr2XKr2NoWCQ4Wmlvpwp40P0AoIJadalTWd6k71r8zN9hpTztPlOB9An0MxceApugMQwQKBgDk6Ti22wTHDgUO4X+YeHi7TvSZYoLM/+xfCX5XtnY9J7bvwDHSD+nNTUA2Ne3cy1uVfHgSukugP4zyitz1bCmomnRWKM6k95s+fituvZI67sywcXCcyctoO8rya/brSqdOLamTTVw6e+f+rb/LUvqGr8u45iPJYMGBFPQq1FVuxAoGBAIYCm73jGiBiONgzlyfYkju4fPIw0YGvfLLK62YMkXBjGOK5LT+LgPdXBIVxSkMsI8Rb9tI8WgoyAjHos1LKhL6DCrYzsRjy4tHoUtcpnIM9bklIWxc2ItcRZs0DxbSj1vQmUVeG4OEl8s7jPpTxvkk3QMyAiHmNuarRZNxC5as4
9a80c7bb-d700-47d4-8d8e-f49c19c1f419	8512bf0a-e668-4529-b404-1a9a552f2aa5	certificate	MIICmTCCAYECBgGXhxB0QzANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVLQUlTVDAeFw0yNTA2MTkwNzE5NTFaFw0zNTA2MTkwNzIxMzFaMBAxDjAMBgNVBAMMBUtBSVNUMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxk1BH7YjuYH6NRsrxpbBB2f/kZlWujUmD3BR85/vPI10ixVC8j6xXypU+3aLgP0e2M0zpk9olrq8FfT8Dz7n8p1RKsOJ0Y/aWRVCaDnyGoISB6ZrxA5GnK4i4IkVu21oUVkWrfVugRCD/4YGEbTfjy8iF+s4vRpXI6gTCJq7EyRoUg8MxFtXk0IOBLeqzSkotGEiYIY6kCcBrc8AqHtrz00FOX6J/KKeFEtmwxJOtvwDT/tjbfZn05+N0vq31ryxG+pqA8ZJS7QEnbHldm3wAog8P9X7uGFunFJlKHEgGiEuqm/uXZEiErnvmtrZpceKLZBvlvv0g3WlwhcsdYBodQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAXeT0ZqdsTu3p7aMuywJuCo7VMwirYMjYe37ZDpiMbOV0lIWgygxYHvX0HbaE3gwoXEEamVs/7Kn9lajD5mAXOmt5Z5GspJvyQiXsynu5vVtBH+mwPkiYN/51wB5DH2YKGxdM0GNI21gkBllqqSWRDhEDwv7CVRp7hK25m4nLBwkxg6gv7x8kIl2drQvdvxwa1enbtIVQd6BRceyRwaejBGvvJ4JlyCop6DgOkHdP5by1pdJ1M3hdMrv7lSKdUr9SsnAcyZfXkw16vMkXqXerDxKKBWHAHopi2drnZyrPZY9KRakdNvkYwDBn6IAlh7jO6JLP8cXphVtHTaO4nI4Hn
0a48297d-8a21-4cbb-b905-277bbe5e44a5	8512bf0a-e668-4529-b404-1a9a552f2aa5	keyUse	SIG
def781b3-ed2f-4f8c-be44-ff6e8ce930c0	8512bf0a-e668-4529-b404-1a9a552f2aa5	priority	100
d5f482b3-6e36-4f9a-93d9-133325bfc61a	e875006d-0534-481d-9bd8-5e0cda540085	algorithm	RSA-OAEP
1fccc119-54e6-4ffa-8099-e24312105c93	e875006d-0534-481d-9bd8-5e0cda540085	keyUse	ENC
6fc5cfa9-3358-4dc8-b7df-81ab6add965b	e875006d-0534-481d-9bd8-5e0cda540085	privateKey	MIIEowIBAAKCAQEA3mCmR3qJ2UrsWItHL4QKPb6nkvCKlrDoU84vnv2qnByXq6KyVe02h7vZ8+tBp7FDCc+dJeELhHAnU1j5aPm7sHwIgfXc7zsQulyujxmhMGzpIr7TT+K7Ar7cce7/sKQBnrT93LF5JAg0oMJZXI9jF8bb7mxn2WjzQQdNmWDIhjyJ3MdvgCwDiwllBaKAezYDt0yKGu54/wEWBsXferGZJaVwVHKxM0sxjmpjIXQDGiH8PhyEkFswsPG9iw1kYcWbP5udQrT5D9fKf98yZCTsrnB9bcZ+VLtw5jhTT86G7fH9Cv1RVGsSiPpqnYVbvjEmyj0PbBRc78T0RVE2gYDD+wIDAQABAoIBABcfaJrNGJFSE5I/ZTcBHUl/ThBe16JEodu4+EWpbbiO1ox/vdhmcoGZnFebEjgcG/LkthvusxJh0Qz/Fuv977CxrPbKeF8dvqcKJRJ3IUYWRQWaXwGS+0wVSXnFVqvo2cxFWJI+l/CRs9s1ajJQLIcX491+QywdmBGeb0iwAhnG9wIo2ntE7/eNtW7on7N1O3vSwsH3IxuFHBC94u0DkjQxcz2qvgKqPX+iiuti9AuhM2OkPgXH8AnOU/aeXln22bhuczhyszy4MxHNnYajZhVzFGFf31xGRws08c+HuYgrT/xSwO5tIDfJ8ssbwJoQVSi/q9nuTWF9fi1VV84X2PkCgYEA/GtPd2yRAulR6E5ANId8cI2GgVxVxJOOIeZ0MZzl1LiT7JrVl8wb+IQjxDyeQb7jcQYYi6Txz8fbTXB+yRkXFvQdd6TWe7/fPzNOPMfWjhznirLqWlJNj6fD901zKYvlLAkNa20kpMyUBuujChG7Xam44AFp905mX+ZA/cRUfTMCgYEA4Yg9SL87r6zeFnRmYypUuoMxSOZ/HnJQzVM+LPWJ1EAmvgsY1o5gTEKkvh1b9z47vo9ajtkxcroT34xQ7Dpq3tu0tQ0Wy5+r6ly2jTPV09blbPSqfLMVJ06SOXejvDS7O+Y0JcxMxaVT3adh43WKKEfzAQSD6q53XhMomO55ThkCgYBeacD6eVgwD5c8XfBz9W1dKAJ0ZlYKReq20V0KpZXtn/BsYmmb8pNPvBUotEe5ba3iu5X4vYRY5HcpmvdBPqo9Qqe29afn95eIKyeLYm/lDfipD0zK5dfu8KBC4uw9UP8yHlyvns5C+eYwRHjiLkm3ueDVoJHDF8cA/b23bXTwswKBgD3B6tYy14tBkQchFLBu9QilyCcoRwL1Vr8C3nG9QuLGNlWwADswfZokXaxZqcdIWV/TLX8UZn/+CFccu0QUsxMXoqI5VVapAJCKlsqPuSvrGqP9U3oWJ+K9lzj5U/LDlcnPPdRj31n37cEyhpGcrBpfqWFL9TucTr+KC4HlO35xAoGBAPtu/54OquPc7R49yXV4TVa7EWEdXO9ws7FFwdCXpoVxPwvkTINTp996NWM86PTonxeMOCjhNbKcSFw35uNdjKHP2TTbekzHynw9xmWjIgESaR7rBH0wqcmNGuymzc5V+iPzYTU9LlqiLuc9edDRgnUltb0ni4g5cctf14e5huvw
82b70140-f6d5-4e83-b40c-33fbeb41e211	e875006d-0534-481d-9bd8-5e0cda540085	priority	100
55ad9c20-48a2-4ec5-8296-c5041dc50848	e875006d-0534-481d-9bd8-5e0cda540085	certificate	MIICmTCCAYECBgGXhxB1TzANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVLQUlTVDAeFw0yNTA2MTkwNzE5NTJaFw0zNTA2MTkwNzIxMzJaMBAxDjAMBgNVBAMMBUtBSVNUMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3mCmR3qJ2UrsWItHL4QKPb6nkvCKlrDoU84vnv2qnByXq6KyVe02h7vZ8+tBp7FDCc+dJeELhHAnU1j5aPm7sHwIgfXc7zsQulyujxmhMGzpIr7TT+K7Ar7cce7/sKQBnrT93LF5JAg0oMJZXI9jF8bb7mxn2WjzQQdNmWDIhjyJ3MdvgCwDiwllBaKAezYDt0yKGu54/wEWBsXferGZJaVwVHKxM0sxjmpjIXQDGiH8PhyEkFswsPG9iw1kYcWbP5udQrT5D9fKf98yZCTsrnB9bcZ+VLtw5jhTT86G7fH9Cv1RVGsSiPpqnYVbvjEmyj0PbBRc78T0RVE2gYDD+wIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQArjP89BHGxkcLg0EgIhcqje1GK4PeZpYFQT5Ng9KrtZpO8ofretiRQ+plXY/h393xgjFigDJ260UQH56uJ/kwdQWFFO/ro9aGAbhswtOWudC3VxXWS6hYBGQ9m4euH28Ld4E7XLznM8N3OWcsfjKXBbmDqlRAs6n5BCObtiNyZ6SQNKVCjw5+gLBqkJHvPVHlDWjeDexc5AfP70v+AkTe7laCkKqPqPIVPEMEJJEEejQtYMGMKztyPIUj2DxVNL4LirDHfV1inkwfUQob7x6+mvC77smvhf6vvlvEvWduPWjFImcHtG+WabFvB9sn9rgb20W8X4ieqcjyqxdP5gaew
e84864aa-0990-4d0e-84bb-235c05a6c35b	c749d082-6e46-448b-a0c5-31c95704acbe	kid	113a029e-b72f-45d6-acf3-9dab30d70d2c
e93bff9f-631f-491c-bf5d-8455593a3504	c749d082-6e46-448b-a0c5-31c95704acbe	secret	ONn9Ca_Z8mw8JHotf2iY9G4AxuiU9EcNVk-rXz56GVTzeBC1ID6mpywBxCz2QopQcdvjK-CGYkQnrunPZ4ZT3t1xEzl_Dv_6WlOhx440FiM-8sThdZrT_Bng6x2ViaCAg8MKFRQb5k_qkA2n9ztWlLa0IAJvzSsgzfCXel7tkn8
c9138576-1a57-4da2-b84b-4e55e116a7a8	c749d082-6e46-448b-a0c5-31c95704acbe	priority	100
253e2098-87b3-4171-8896-f210c1a47f26	c749d082-6e46-448b-a0c5-31c95704acbe	algorithm	HS512
a08fcca2-734d-41f4-84f4-9e338302f333	1e1a7397-3a98-4c90-84cd-e37d7955a2ec	kid	3025f524-5955-4dac-a736-6e885ff6637d
1b88ac24-07ec-42fa-8d9b-6e855336f3c5	1e1a7397-3a98-4c90-84cd-e37d7955a2ec	priority	100
93e76fca-8bfe-41f9-8109-05c85545a9fa	1e1a7397-3a98-4c90-84cd-e37d7955a2ec	secret	_6OYmGZnrY8vcIlAtwSSow
0933d842-f83c-48d1-80f5-b9d53fd3e280	5598edfc-2c7e-48fc-8977-055bcbc6f31b	allow-default-scopes	true
7a4bff45-dded-467f-8e7f-2f7bc1c5ba1e	4e5c32b3-839e-43cf-84ef-7bf4861d3435	max-clients	200
7dcbc54b-0b90-4866-a98f-a0908b82c9d4	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
67f7b640-157d-4ef4-99b8-83fe82dec2d3	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
341f6534-8b4e-427b-957c-63ce116928c4	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	oidc-full-name-mapper
6e05cff8-cca2-4331-adf4-3d40c1495937	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	saml-role-list-mapper
f0ed8fbe-7072-40c2-a8b4-a04ec0f8eb0c	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	saml-user-attribute-mapper
aec0aa47-2da1-4fcc-bc8b-fe88aa2114f4	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	saml-user-property-mapper
ee6cca73-fba7-4441-9e5f-e39a01f3b419	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
56cb05a1-d44c-4c2b-b44c-b922780eecb5	541f183f-dbe8-49c7-bbaa-41532cbedff2	allowed-protocol-mapper-types	oidc-address-mapper
fdcbe5b9-7a23-4cce-91ea-a0cf783fe694	daa63e27-102b-4b42-bccc-14bd18f4565d	host-sending-registration-request-must-match	true
f3a96d82-bb1e-40f1-a0c5-40312210d6ce	daa63e27-102b-4b42-bccc-14bd18f4565d	client-uris-must-match	true
651a77ec-2daf-40ee-8663-0bf0997fd7dc	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	saml-user-attribute-mapper
0e360cda-43f7-4909-84fd-da45aae5d3f4	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	saml-user-property-mapper
2958da65-765a-4983-87b1-f87ff5db308c	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	oidc-address-mapper
907f0b17-3271-4a65-af86-f9c9966912c3	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c124719a-770b-408b-95ad-12bd4b7adcba	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
61ccb398-c9fa-4a65-afa3-da996fad6b16	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
836c3698-5936-41bf-a0a1-83d4eff3aac9	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	oidc-full-name-mapper
1df6ada1-f5f4-4e50-a67c-2683339c723b	95654870-76ac-4bb4-af04-204493627a5f	allowed-protocol-mapper-types	saml-role-list-mapper
28f81404-21cf-4824-bffd-f98149976738	4dbcf22f-d6b4-4ad9-a09f-b7adce88ae52	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	1351c47e-6862-4e2f-a309-60fb75869633
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	ff1a65ca-2e7b-4429-94f8-f580828f3fd3
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	9f0d6d59-7b2c-44a9-80c9-8c501946366b
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	787585f0-9e70-4d6f-b7f8-a3c3d3a90eeb
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	d96bd495-115a-438b-ac76-b143c3f83e6f
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	c91f3abe-9af6-4d8d-a835-aa1c03dc733d
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	89b265a2-9c59-45c3-87a5-d3fc8687dcf1
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	8fc7c801-4fb8-4fbd-8ec1-9833ed9cb0b1
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	bbfbe6f5-852d-46b7-9116-d5e85cad9de1
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	4161579d-383c-42cc-9bc3-8598fc6c5389
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	3808d215-74e1-4c9e-afea-078e250b247d
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	784e7640-3cca-4dee-87e0-3d6a12606bc4
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	4d6c6951-8f7c-47d6-8590-507fa8f831e2
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	8d64573a-13a9-4bb8-bfaf-6c570c32e6b3
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	66f368a1-10e6-4f56-83fd-162417b29193
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	db4fede8-8c1e-4458-9854-fcd1fe0edad9
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	4b60a2a1-c925-4344-ba51-45a8eda96353
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	3d4b91f8-1d0d-46bb-b58e-0624649fe756
787585f0-9e70-4d6f-b7f8-a3c3d3a90eeb	3d4b91f8-1d0d-46bb-b58e-0624649fe756
787585f0-9e70-4d6f-b7f8-a3c3d3a90eeb	66f368a1-10e6-4f56-83fd-162417b29193
b1ea3da8-e3b1-427a-9107-5c64ed6d4e12	710c5141-64d8-4510-ab95-30c5fbb554fe
d96bd495-115a-438b-ac76-b143c3f83e6f	db4fede8-8c1e-4458-9854-fcd1fe0edad9
b1ea3da8-e3b1-427a-9107-5c64ed6d4e12	6fc23fa0-7dfe-46dd-834c-802f56720692
6fc23fa0-7dfe-46dd-834c-802f56720692	00c93105-1404-485d-a83c-9820073ae4fe
9461857b-5420-4be8-97a8-2ad954ddb5fa	1e5bddfb-26cf-4332-beb1-36b2f945ed12
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	26607b5c-50bd-49aa-9ac9-340dd3a26c15
b1ea3da8-e3b1-427a-9107-5c64ed6d4e12	e34c9786-192e-4122-b406-089332419ce1
b1ea3da8-e3b1-427a-9107-5c64ed6d4e12	49d9e087-1ea4-47e4-9fcb-1799ea6791c5
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	5236ded2-717b-4cc8-8e7f-9335d0618c46
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	a8764657-7fae-4b9b-8c5f-86c921ee1ba5
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	f64416e3-eb4a-4361-b24c-49b6b1a1f295
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	91b792c5-4c4c-4376-94db-5ea8326898ca
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	d49766c5-ff46-4e60-bb5a-fbd7c0ff1976
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	3e5005dd-43c1-4389-8cc6-364b14d4e0e4
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	0fb3fe54-ecec-4a8c-ace5-f8d83feb5af1
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	96a88100-3320-4723-bc44-f0e5e960c03f
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	c3ee17ce-105b-40fd-abad-f474a178ca8e
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	47c30498-0b84-4be3-bb4b-28821ffab0f5
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	38977c12-c601-41c5-8fad-568b83dbcfb3
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	339e3bac-b554-408d-aa74-5f5b09b0f2c7
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	7741fde6-9132-4017-9a0f-eead6239f445
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	b79eb8ef-37b7-4816-a4cf-e64e9dcd4f61
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	3a1fe55d-e8c9-46e4-a45a-9a930306e879
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	d9412572-7380-44b7-8e4d-bbebd0fe3e01
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	adad7302-5a28-425b-aa67-f5d375a8c61a
91b792c5-4c4c-4376-94db-5ea8326898ca	3a1fe55d-e8c9-46e4-a45a-9a930306e879
f64416e3-eb4a-4361-b24c-49b6b1a1f295	b79eb8ef-37b7-4816-a4cf-e64e9dcd4f61
f64416e3-eb4a-4361-b24c-49b6b1a1f295	adad7302-5a28-425b-aa67-f5d375a8c61a
ae6e867c-83c8-435e-a121-45429a1feb9f	44412e86-f8a4-4c22-9f55-131fc54fda73
ae6e867c-83c8-435e-a121-45429a1feb9f	cf1dd76c-b0a7-47aa-9870-79ab1381b419
ae6e867c-83c8-435e-a121-45429a1feb9f	7b67eb31-b785-4854-a7e2-406205fce8d0
ae6e867c-83c8-435e-a121-45429a1feb9f	4b5ff577-2d9b-42f5-a41c-ff131b41e434
ae6e867c-83c8-435e-a121-45429a1feb9f	f8c02989-35fc-4bee-be4a-3232d31ea621
ae6e867c-83c8-435e-a121-45429a1feb9f	6ca06103-ddb8-45d2-a3ae-16f735c90a29
ae6e867c-83c8-435e-a121-45429a1feb9f	87d12e42-58d4-4ea6-9b5d-6330056a6c04
ae6e867c-83c8-435e-a121-45429a1feb9f	da333cca-84ef-4d1b-9c7f-bfd6b7b1e7d2
ae6e867c-83c8-435e-a121-45429a1feb9f	488afd52-ec70-4d4e-a87e-8f872b59983a
ae6e867c-83c8-435e-a121-45429a1feb9f	31a53807-20ba-4b2b-b645-4252670a492f
ae6e867c-83c8-435e-a121-45429a1feb9f	f871de57-288d-4c55-96ec-1f0114442efe
ae6e867c-83c8-435e-a121-45429a1feb9f	1cab6341-3028-4021-a636-487fcf4ca4ef
ae6e867c-83c8-435e-a121-45429a1feb9f	a5cca8f4-5b9f-48ac-92da-156b13b7c5a8
ae6e867c-83c8-435e-a121-45429a1feb9f	f14be8be-f6e1-4832-8ac2-adbf9356e1c6
ae6e867c-83c8-435e-a121-45429a1feb9f	c612dcef-ecaf-48b7-94a2-153e7bdfc5d6
ae6e867c-83c8-435e-a121-45429a1feb9f	cd44c42e-cd12-43f1-910c-6660be142b2e
ae6e867c-83c8-435e-a121-45429a1feb9f	dbe5824a-123c-4de3-ab64-4c809ecb4424
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	c6f165e8-3418-4f72-a55a-cef554957f3e
4b5ff577-2d9b-42f5-a41c-ff131b41e434	c612dcef-ecaf-48b7-94a2-153e7bdfc5d6
7b67eb31-b785-4854-a7e2-406205fce8d0	f14be8be-f6e1-4832-8ac2-adbf9356e1c6
7b67eb31-b785-4854-a7e2-406205fce8d0	dbe5824a-123c-4de3-ab64-4c809ecb4424
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	01c3804d-d393-4a9e-a8ca-904e71f93ce7
01c3804d-d393-4a9e-a8ca-904e71f93ce7	199ff76d-4d3e-4f9b-910e-d411d495e714
6e04d2fb-1b45-4873-be89-cb9e02eecac5	f4af7a74-cef3-41a8-be27-e3ac65d04cc2
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	8a53d96b-0c54-4953-9a26-e7e704dc7ba1
ae6e867c-83c8-435e-a121-45429a1feb9f	8c807cf0-739f-4396-9aaa-ca22851e39e1
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	9bc9fbe8-8e84-45ab-a8e5-a3f68948aa79
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	f5124edc-22ab-4699-8e49-66c5ec9868c0
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) FROM stdin;
197b0a8f-f4ac-4a74-8612-667708844632	\N	password	33a3d791-d25e-4142-bcc0-f58cbaf37e73	1750317352323	\N	{"value":"vA/J/FC3RU431RUWqr34tIoJkamlPhHM8HNB84xq/V4=","salt":"dFh5/wSZnz3z+QFTNVZKPg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
8c5168a3-982a-42f2-8ede-ad751cbc5794	\N	password	cf7e5366-b07d-4cac-8ef1-373632a60818	1750317569937	My password	{"value":"wIjESIS8Ig4EqZRBJ/J8HCpPl0SuVAom17Ev5Q80gqQ=","salt":"u810LQZ6x4BPdfM3b0oarw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
7ad7e552-8cab-446f-a8ed-05c4b2e93183	\N	password	ed137331-a9f0-4e84-b3b3-0ed5e026484d	1750399628623	\N	{"value":"jy1hsB004v5N5PmpcXekgJP/DzH9PQasslNqf1WR8cc=","salt":"WbOTMSlexRTRkL9D3DyvQg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
106fe287-24cf-43b8-9b84-ee50ba032034	\N	password	eb931243-5526-4798-9281-26f371b43659	1750773217436	\N	{"value":"Nj7bVKDo72OrqnCFd85I2AxeDS7+ba16T9pglS1BA5Y=","salt":"72hA0PZTWLxmMfymT8HJgA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
0a1cf8b0-6c3e-4ccd-b394-64921495b900	\N	password	c2a1a253-894d-45af-9277-59bb74ee6587	1750850017638	\N	{"value":"W+m3iLNVFsmQCGI2brV+6v54lgpkTjXxvoFlfdBkKF0=","salt":"WmjUNv4w9sM9nVuk0iqjxw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
d1c58501-f3ea-40f0-80e7-1980e5db431e	\N	password	96db1114-75e1-4a83-a16f-f8dcf76ed677	1750561766425	\N	{"value":"1NU6lROAHn6njTksTnX1cIy54KTrNM6ITSA/WUq4634=","salt":"NHXi7YR8RJwGy2DpwiyfIw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
50588fdf-5133-44b1-9319-636fc30dae88	\N	password	0fa69601-b3fc-43ea-9976-c33995c633b3	1750567424766	\N	{"value":"5caLJ5Gb/pNBoBz7pVKoLZ458TNZE2lRDPokFPL3Sko=","salt":"V/k1I8nbx3Ugvue6EUVkdQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
69277f18-7362-4312-a747-8e06e7d9da23	\N	password	fa5e48e6-ce1d-43df-a401-735dff7e58b7	1750640600875	\N	{"value":"VtfB7Y0S3f9kGYt8KRqJ1O5ZkcZCt4XukaitRSWth8M=","salt":"1j+2cHIVB4MfAb4hikqdHQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
d2164462-eb26-481f-9c38-e95aee9701ef	\N	password	e2e547ff-452e-47bf-90b7-3b0ccb56873a	1750647010194	\N	{"value":"34T5k9rKVScSBF8LgghrQ4luki621MDM3diZ3EtTvV0=","salt":"JPTddL7lolCoeB1BQyPUVw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
dbd994e6-074a-47e4-bf61-8a4e31c17d84	\N	password	9ae585db-cae0-4d7e-b350-3c786117064d	1750654070885	\N	{"value":"755gWmYtC8hppFy2E9h11N17fOjvxS7mJ75Gzm9qteo=","salt":"GM6R2yEnW+XmmGPZUESIBQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
e8bb1070-20e9-4491-959b-152e98661315	\N	password	ec86151d-ca0c-4a7b-b2e2-b648fabd5216	1750662456309	\N	{"value":"j+36D/wZoZ7IBujFsVlbrqIdmHX8NZUCqXa8YIWt2SY=","salt":"o/zQBYwoGqwT1t60UlLkPQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
a1030d44-b657-4442-9a23-19e20a533fad	\N	password	c0125d7c-f131-4eb0-b81b-bfb2c63a4b10	1750823673619	\N	{"value":"sZNjtoOmZ20gi7uay+ZNdAU+aN1R36D3cTTSnoVFyIA=","salt":"MMqJoiilYcrPhSYEIiMj7w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
bf4e9705-7cde-46c7-92fc-6fbdbf40366a	\N	password	f80339de-5607-4b05-9728-3fce984c7eee	1750835409053	\N	{"value":"JvX7CixNckva8Zx/fBXxeadkYfcKd+dQ4OAwYt0VE6Y=","salt":"BNOvGXSgfXdVuZ099VedqQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
281fc236-7200-497f-8119-9932cde3d544	\N	password	43a93a2b-d34a-49a3-9f73-203329648b14	1750841625588	My password	{"value":"qyrjgoTRlsnuIu7CfLtscZbPCsYZzh9Ep6hNek/2GOQ=","salt":"3npI3LkqurpAmbUHbVYXGA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	3
5b60a62d-e1f6-45b7-a991-432c76f56515	\N	password	a06bf14a-791c-4bf8-99af-47de4ea2e802	1750867698113	\N	{"value":"1vbaxZB9uLWbrmyz1h1HKhatypd4znBeLC0+y96vJyo=","salt":"VAsGf/xVeYQeoD5Qo5PhzQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
c7f613ed-39c6-477f-aee1-c551267649b8	\N	password	493967e2-5d44-4046-b93b-d49990fb9358	1750871265948	\N	{"value":"pUDdT4TnOkYAf96wTQBr9ieVTir6NalT2q4r7OjN3us=","salt":"+9Z6S1eGjrXuRSNvgHpm7w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
a47cc56b-a7ab-41e4-bb8d-8393c08bf4b3	\N	password	37d8ea36-1a01-447c-b0e9-9ab346381a15	1750908675729	\N	{"value":"F/pjpMQ7DxEypQGhYtFx93LOSBAfEkgzphoTGN8ohd0=","salt":"OMjqjxdz9/i/ht/KdWDfxA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
3691fa37-f50c-47c0-8333-ede1d2ad22cc	\N	password	caf9fb60-2a00-409e-8adb-af3c2eb57a43	1750921517462	\N	{"value":"YF9G+Bd1EWvpM1WtfHSoTAA4tnLr5vWkHyh8p7/TB2I=","salt":"9e42J+vDbmbmkqOtBaiJRA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
779b466c-c9aa-474a-b6e2-1411888c291a	\N	password	d2b22925-ae27-4f9d-b78f-0f6467dbed57	1750984043293	\N	{"value":"U7lCPAm3E1bKJn7jLA57xfsS3Rj6PkZa5DyA/HVfXjc=","salt":"tnKYOhz2waWHrYVnXw31TA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
2f237479-da8c-4d34-bc64-91d504123929	\N	password	b3dcbb2f-bc34-486e-8767-0f87d08a57bb	1750989828184	\N	{"value":"uc5b6WFkzRRCRY6/ZOWVFtIGXkWX4NrLn7ViTs0u3ZM=","salt":"el+OfX61sfJrCckvyU9i4Q==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
3b5fdcf5-35eb-482d-b5be-7247b2edc124	\N	password	1a9ad95a-5e37-4b58-8c94-14a0a7e8ffa8	1751011876700	\N	{"value":"/E81BZ91y+eSf8JuC+DWK9r6oVUh1jB9hIRP5ayZJy0=","salt":"EaQ4ihGDGRsaiKG03CibNg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
ba3ab1ed-eabe-4434-b9ee-d3742a5fbb56	\N	password	0d2036ad-4fa0-4e54-9f38-ec35be7de0e3	1751101894845	\N	{"value":"XIXIyJMGV11LSskmZXE4x8Q+3/BehU8HTK5ZEihPl5A=","salt":"z2XSB2t7Rvq4ue8v2A/vMQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
9626c602-259e-4b04-aafb-419a252af548	\N	password	b049ccc7-f340-403f-8707-2987cf236da4	1751110387073	\N	{"value":"4VmTk9uFCmFFqq4o8f3cVgO2rtYaXIhAgP2NfJAGJ6M=","salt":"QpSg5EERkNF+awAIDM5+fQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
5719d63b-46f3-42ce-ad2d-df2f9450b771	\N	password	0733bc2e-fbe7-4e22-8334-eeb2a6d321f6	1751141126120	\N	{"value":"VeXAFCQJmFvU+fghtXEVMpphbOACh+BAodEz0c8gUOU=","salt":"5o4bTsUG3qW6gfBo1qRFSw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
97083ed6-cfe8-4ce3-b2cb-05a0e1a3c812	\N	password	be1b8b0f-4467-4fb6-8aa0-f3bf31bc1d55	1751249063542	\N	{"value":"Z2tn48kfrueA9UevNQT33YchP+36y40Jr9QC+PD7bg4=","salt":"lY5A5gAa2+YYA7bG1KgHvg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
74f82664-3638-4cb2-8eba-65e37345154c	\N	password	b87843ff-6aab-4864-95a5-86d00784a693	1751933172606	My password	{"value":"vvoE/S5g/rYUO3fedL4hVNj13G2+hMMkjEV607dIMBE=","salt":"2lZYDgj/6Co4RHYNRZEHaA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	4
767fcaa3-34dc-4b41-9f61-63e5ea598e11	\N	password	4c123de5-b7dd-4adc-becd-5064799b3b70	1751258439269	\N	{"value":"U+qVbCfM2C3GHf/SbgHObX9n9AOoMT2wNcjgb5m1Ojg=","salt":"Gmu9b09l0BQ8ZJkl8x67KQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
f0ca10d1-68fa-4284-ab0d-3a2992113806	\N	password	a140f0e3-9e46-416b-9f2a-427925df02b7	1751268974089	\N	{"value":"Tytnwbpa/K14A6QdEO+3zrNDmbvSOXSv8GAOjHQ1Rqo=","salt":"fr0DatxrTKNoToR+K2FdEA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
6e8fe374-f365-4b33-ac78-f5a605dc4021	\N	password	88bf5eae-b6d8-4d9c-a1ee-c161c74ea564	1751270671746	\N	{"value":"umxkzLMFI5DnQTZpSnpafqojDoEhik0PFakTb/ZCuyU=","salt":"mNFOH47CEv7F6aVG6Cxv3A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
2425c180-b166-442b-909b-7fd5d5f997b3	\N	password	937d3525-b853-4296-8c5c-31f826458677	1751271343422	\N	{"value":"6on7yIjCDH1k4b13FYOoMZlbtORPYsUCjFXhSoGZDjY=","salt":"1JlbactcLCwh5o08FImjOw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
08c23028-b921-45a0-bcdb-525f174f4049	\N	password	a101054b-6020-4173-91cc-e3575fb9d377	1751271421986	\N	{"value":"36JQHYmAjAttIJ6nl+MrArt1YKFSUqI6Jlx24L6/OIs=","salt":"DAxxHNe0j/8PJq7jkW/eqQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
ccf36961-5cf0-4580-9933-20db979868c9	\N	password	5d17a0a1-128d-4967-b15f-bb661b871381	1751279787903	\N	{"value":"2dgXk2eMHDAbPC9TC7Z3DNrMSN3h3SSiqrREvu9406o=","salt":"ro6W3KKLPf93IeuuUMHhkw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
2015eb56-e5f7-482e-ad4c-0696bd9c2f21	\N	password	3fc506f7-07d4-4e7d-87d9-6f8aae3941de	1751329138932	\N	{"value":"X9o+DfuDiFLh1VIfEkRJMHqjAg+YZRP1TJdtadu58ZQ=","salt":"uBf+SZsv6imql3uqZrQVmQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
b09b11a0-4ef0-4060-bc84-e0c5899a61fe	\N	password	e9e94382-f6c7-4ee6-b3c0-676ff233b9f2	1751333505769	\N	{"value":"qGPMcbNDcrBbsYmdxA1mdMPqR8rkNyDDqCei3onXkIU=","salt":"WskEJd0n+PB/ujeNY0lbaA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
af4e3be2-53d4-4685-8766-7b1e5dd0939c	\N	password	395739de-af2b-4b32-ba80-36da99d6b0d2	1751350019414	\N	{"value":"eajYuZswHFnjvNNejsXwy9cYMM7YqwGN9hJ5WMlEjgg=","salt":"1bu74I61QzYEEdb+B3klgg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
46296673-9b84-4a05-87fc-2c697242b0cc	\N	password	d7333d22-42ea-4b35-9def-7fe0d2c59fd1	1751358724371	\N	{"value":"gS6sIGB4qbGTTOl2bb1ixR2wT8NfWzn80JWZ1cB9eY8=","salt":"dPOoI3JvFVwlYetEXk/qww==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
04796eff-47e9-4ba3-ab03-cfe640e09d26	\N	password	260ebc62-0717-427f-bb04-ac79ad166a7d	1751362222387	\N	{"value":"Jj80+IXtfTo4X6KkO07/eoDTQTDtlb/YQfPomadgiWU=","salt":"zuGVs8zy/5OgxxucAq5h7g==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
681fe465-4e54-4786-a211-31a29058cc5b	\N	password	0a8d87eb-6f1c-4418-ab79-681c6463f21c	1751362452540	\N	{"value":"7AfvoDcFj/Q9jpY4OvbplBUyNnVkLockygeWk00TwjI=","salt":"y7MB5pO8jI9rZwhCcjnv6Q==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
57ac9934-7817-4e2c-8ec3-516cc7929aa8	\N	password	41c7cd25-e849-4d00-9c0d-e02b934a45d4	1751384076382	\N	{"value":"/qffveG3SbQmw83F6A9wmNgzSzFmx92EHveimQFB3G4=","salt":"FpfM1gkzxwn4D98B6KUOww==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
f14a7994-cb37-4a65-9a5f-856071ad3a1b	\N	password	174f49e0-ef59-4a4a-90d1-3bfb723b8fb4	1751389073110	\N	{"value":"n6JNr5apomUIFqWpHk4UtAGnzMLLW+VktncSHmWCz8k=","salt":"lnyhmR+Dih5p8hLi6a8q8w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
8176b5ce-66a3-46c6-a2a1-3c5625a1d7e7	\N	password	a3c71daa-daa0-4485-ab75-c59de77aee4d	1751439155869	\N	{"value":"lyK+JewI+5IGBTrzzRpWLe/OhownHlu0zAAKWQXNcgU=","salt":"i5wqZt2u2N/8KlJlV8dhKw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
ad6bd602-f616-405d-8b90-a4119f368b51	\N	password	053c73bd-f8db-46b7-a509-c75037e15172	1751440228835	\N	{"value":"qu6W/oPap0Q1zPO4KACN8Zk9Vy+m3UdxRDnlbPCFEac=","salt":"mP1g6C1fH6o3jWcMBp5a1g==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
67f1b09a-e497-44fa-a885-e52bf2863deb	\N	password	108969c9-5c5a-4779-8cb6-3aeb0ddc1777	1751445602518	\N	{"value":"S+kLFVsIt1FkbVTHJD8zjYOWItgFqp1C2BnsnIHYPog=","salt":"vRoJJn9GyqyCox4XVqIybg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
8f5f6b23-4c8f-408f-9c68-f686b92ecd5b	\N	password	d792826d-6aa0-48e6-a525-306e735bd5ce	1751445640402	\N	{"value":"NclmYerjA856VIgjlbYQrvt+s8OtQbARgeCVqZABSCE=","salt":"p1AgpxOjw7BWxRWR2fAcsw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
b46987b2-206d-4526-aaa1-67594b86c4b4	\N	password	505a64a9-b535-44a7-8d72-9f0c9a7dd061	1751455773999	\N	{"value":"3cZCdEtlA/vNaFpb5ZyAMQtVrgBr/GjHr4ZAaTGxCcI=","salt":"zDA/dqw21oBs0B6vBUyuBw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
6336268f-b511-45b1-af47-dcf5f5634997	\N	password	5000d671-512d-423c-8e86-d287b963d2db	1751457620242	\N	{"value":"3YADb40HjLVPllrAAwZSTUDD2rkM7/5ufUghvdrXdgQ=","salt":"z+F4QMYYz3zW6OzIQg/z/A==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
f44e6a90-6615-4165-a642-0d3904bb602f	\N	password	4782b99d-7aa5-4d06-8767-bfdf3d0f1c2a	1751461783507	\N	{"value":"vaASi7QX2giVxXD/mJOPyaonRyrMxMcnq1+E0SMSZY8=","salt":"27kgvH2NAn+72OkqeC61CQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
83587e8e-7bd5-45f3-96ea-43976078f242	\N	password	a8bbac7e-c5c4-448a-bf23-d7931be69c13	1751470245020	\N	{"value":"WG487M3LNYGChK2SzRXFTTlzXvrx29cESGfU/Uj4gGo=","salt":"awTpCXFH3o046ad987zHvQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
2c43675c-ff2d-4467-9299-51daaf508f43	\N	password	85b79e02-763d-4502-b1fd-247a9c2c42c0	1751474707562	\N	{"value":"y8CpjhS2DRcK4cias2ymA1zawc2qzrEr7uDmJ++1CCI=","salt":"jO2EXlImkAwDflWIUlPxjQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
0323d9a7-536c-4d5f-b0f5-4d69bf34e720	\N	password	13a74e6b-b98d-4e6b-97d1-01a103009dd9	1751523204304	\N	{"value":"6Z/zNTPMkI8xai1VaDFL5hUslQfTJj6ruv5pPmeEU1I=","salt":"E32/kJkLW4C9HeGkweRjig==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
9a6f9ab1-f05a-4695-8f2d-b9bbf1e9b427	\N	password	6751cf92-6f1e-4f97-b0d9-254d6371ce20	1751527680679	\N	{"value":"CsjYkMn8oq8c0aGwenEFj2iNmncV60KC4DXDz8HGKgQ=","salt":"VOv/1wL0jh1QYKnAowzdYQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
d3dcbdf2-667a-49d0-8098-f67690dec230	\N	password	5c7db0d9-94ab-4f4a-b685-6ff51dfab3f7	1751532122020	\N	{"value":"VpjYf58bsdfXAD2fsP+0YGGOKLBSOI0Udlsjd/xJrbU=","salt":"MpB8oZbbOTUPTjb98yuRIQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
505c9740-4fa7-4084-a06b-2f8eb21cfea3	\N	password	a85c5cd0-ae81-45c4-b0ac-4885f9ef46c1	1751532187381	\N	{"value":"Q64nVCbDeDEFUM0f/arqTQYkLAYBro71Iz+JXDmG72I=","salt":"6FoIWCNT3QuCUf3UhJ7uRQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
ef5ce0be-9d72-4837-bcff-c035227fa2fb	\N	password	04184e6b-5a93-414a-af44-616b24cf9ccf	1751554965759	\N	{"value":"vEdcDXRSw7pyhm7jlb72eJILM8rp5CO9fE5VuI4HttI=","salt":"afq51Mu0VfQ2OkiqhcF77w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
3bafea0d-c8e8-4e8e-a77a-844158cfa637	\N	password	39836209-d5e9-453d-9f5e-ce75a906bd60	1751560380152	\N	{"value":"bu2ifzB2o7s4KraBN0LMi6u+fU7NswxnTlsXeEEX05Q=","salt":"Ahjvr+Vv/gTd7jR49ARF9g==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
291faac8-68f3-4498-8610-d01f70852e36	\N	password	a1c2b840-08df-4398-be4e-e59514183896	1751594174447	\N	{"value":"1hPuD+cl6vfjAHQhmoRm/ibN1hrbn6khHAR89dFvTXY=","salt":"6yrzMb7SPDsrOhlf54bHwA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
b8ea310f-b4d5-4b99-a35f-f9e7715684ad	\N	password	45d4877c-8133-40f9-871a-a5a8601b63c9	1751602623354	\N	{"value":"HPHJLj16UtZ52xWOppDL2fEfDMfOgAjDKieSNhsoAZU=","salt":"U5fbQ2xle7V7GJT/Y7bUMg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
bacd109d-247f-401a-bed3-a536707c2b75	\N	password	7fcc687a-c5e7-41d2-ada0-1df63a51880e	1751605316140	\N	{"value":"OAnGVAsexqU2Npi4DIxYla+5OYl+QDjltQT5jVtJFgA=","salt":"VCVzTZ3tYnmrZF8+jye//w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
4ee8b966-7504-4bd6-8b9e-dd922295a035	\N	password	dfcfd48a-afdd-47e9-9695-9aa0365f30c1	1751609093700	\N	{"value":"KiggZVHMcD9aqf3XADC95AdoniXRnP6aY8Xxioq0FD4=","salt":"tMdCOJJWGC8ELwy3EQpm6Q==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
abbeb14f-b0ab-4b80-a135-27c97113bf0f	\N	password	b64cf40f-ec10-491b-8e65-ee9df75b2335	1751614900312	\N	{"value":"VSAAvgILSGw2bGwbjbjOtA/lEHAHKSjMLhy/gnCyah0=","salt":"/zlWnBPvhEN4SSPzyccSqg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
21b243ca-6fb2-49b3-a883-288c92435b56	\N	password	d332cc9a-086f-4b78-9c9b-ed53404636cd	1751619265934	\N	{"value":"BJBUTz4t4xbK+ChNocPTwjxTw+hikP/N3H8S6Enls6M=","salt":"Zu3yWQo2JF8yZmsMJdiAMw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
dbe08856-c41b-4343-bf14-9ef75d8769a4	\N	password	e52334b8-c138-4a4d-85fa-e2a35d7968e6	1751621250874	\N	{"value":"+w9HOBr6VGooRXKB6R0Z5uk0nMdr1AZIrxuleg1ncs4=","salt":"kv5eKZsqqs8rE6ve/plVHQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
7e556cc6-b235-468b-8a3f-f3ef0bdb16b5	\N	password	27f2d557-ea6c-4967-a1a4-eb4c7ec530fa	1751799218412	\N	{"value":"S+tTQmHX6RUbJYMIK6X3tPt7LWO9l165fWHhLGumMKM=","salt":"lFnS2eLlRO/Ur6HyBe3n3Q==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
ee97d7b7-ac5c-434f-9175-fbf9d581b1bc	\N	password	ef869940-2e2b-43be-b15d-dd54c4862a90	1751865272002	\N	{"value":"/zb5H8QQzNYIzMBmsOND39pdzi8cmAAlXeizrt+yQK4=","salt":"1DJO1lNc53sIYUZ7+XmV1w==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
98ff4be0-c6df-4096-9bd3-bfccc1112cd3	\N	password	905d3736-39ff-4b84-a0bf-ab926a86b07c	1751940638415	\N	{"value":"MPovllifkF6J6b2m6A+t8VsQf9h+N953nkFcwvzgGbU=","salt":"UjCsfYk/83sJTm23aHlXVg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
424c8456-d41d-482b-9d07-b8eef9c3497b	\N	password	523b61ff-99d5-453a-a2ec-487ae0f1c552	1751870985345	My password	{"value":"VDRoOo9oSZqiA43FYE/Qtq62IlmytLJt04x8nb5dWQg=","salt":"emzDgFbT/NAJl1ltFbH1gg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	2
550c3b63-c6e2-4528-8e73-99e3ae3bdb15	\N	password	6b42945e-0f3e-44a5-8ee8-5dc5930ed116	1751957987684	\N	{"value":"nNKp1DcgO7XkhxBvjDoL+XWuFqWpBpQsIOcqLjPFtfA=","salt":"SSdmOh97ESsrTVGgCtihsA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
6eb23e6e-4552-43c7-96d9-1e7931c91a89	\N	password	2bf7f5bd-82e6-4764-860f-247f774e5c59	1751872073891	\N	{"value":"KAP7Uhw6jfCY3GZ3CwKKmF6I8AIQqAQbt77jIvZeBGA=","salt":"y4kKg4Z9y6JOitRMtKkwIw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	2
2d7ace5e-3ab4-4501-a6bc-ee1195486f75	\N	password	303f4c38-656a-4a09-b16a-5b9e20c9a92c	1752035362142	My password	{"value":"bAhIEjxKW2yVhTH6axMjU/axspU6NXcouGKmEuIs1uk=","salt":"B2D3hKS+4TXC8dt+UkR3Fw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	2
05ff8e48-972d-420c-ab1d-12cae37ed41d	\N	password	3ea0f5b1-93df-4dfa-9099-2ad50590d7ef	1752654320419	\N	{"value":"T2+ZrcC5V/1wESiLgrVu5S6jUIbZlCo5F1YXvk2YQRE=","salt":"ay5JnnbXE6ZsYhdYSmPiYQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-06-19 07:14:59.366841	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	0317297071
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-06-19 07:14:59.434139	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	0317297071
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-06-19 07:14:59.640693	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	0317297071
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-06-19 07:14:59.668233	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	0317297071
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-06-19 07:15:00.02771	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	0317297071
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-06-19 07:15:00.038161	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	0317297071
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-06-19 07:15:00.523493	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	0317297071
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-06-19 07:15:00.535428	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	0317297071
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-06-19 07:15:00.618817	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	0317297071
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-06-19 07:15:01.017966	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	0317297071
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-06-19 07:15:01.275359	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	0317297071
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-06-19 07:15:01.317692	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	0317297071
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-06-19 07:15:01.432145	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	0317297071
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-19 07:15:01.518487	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	0317297071
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-19 07:15:01.5228	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-19 07:15:01.527807	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	0317297071
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-06-19 07:15:01.535475	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	0317297071
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-06-19 07:15:01.765835	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	0317297071
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-06-19 07:15:01.917638	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	0317297071
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-06-19 07:15:01.92878	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	0317297071
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-06-19 07:15:01.936915	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	0317297071
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-06-19 07:15:01.966589	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	0317297071
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-06-19 07:15:02.418659	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	0317297071
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-06-19 07:15:02.429639	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	0317297071
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-06-19 07:15:02.433719	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	0317297071
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-06-19 07:15:04.474446	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	0317297071
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-06-19 07:15:04.672246	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	0317297071
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-06-19 07:15:04.6804	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	0317297071
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-06-19 07:15:04.883797	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	0317297071
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-06-19 07:15:04.976094	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	0317297071
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-06-19 07:15:05.068083	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	0317297071
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-06-19 07:15:05.079624	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	0317297071
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-19 07:15:05.09277	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-19 07:15:05.098158	34	MARK_RAN	9:f9753208029f582525ed12011a19d054	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	0317297071
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-19 07:15:05.196114	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	0317297071
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-06-19 07:15:05.269208	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	0317297071
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-06-19 07:15:05.277649	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	0317297071
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-06-19 07:15:05.285292	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	0317297071
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-06-19 07:15:05.293158	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	0317297071
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-06-19 07:15:05.297087	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	0317297071
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-06-19 07:15:05.318414	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	0317297071
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-06-19 07:15:05.325849	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	0317297071
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-06-19 07:15:11.76392	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	0317297071
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-06-19 07:15:11.770717	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	0317297071
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-19 07:15:11.778662	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	0317297071
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-19 07:15:11.785599	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	0317297071
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-19 07:15:11.789127	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	0317297071
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-19 07:15:12.175938	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	0317297071
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-06-19 07:15:12.182218	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	0317297071
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-06-19 07:15:12.36075	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	0317297071
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-06-19 07:15:13.614613	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	0317297071
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-06-19 07:15:13.623639	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-06-19 07:15:13.65204	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	0317297071
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-06-19 07:15:13.668327	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	0317297071
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-19 07:15:13.677221	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	0317297071
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-19 07:15:13.685597	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	0317297071
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-19 07:15:13.872687	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	0317297071
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-06-19 07:15:15.086383	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	0317297071
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-06-19 07:15:15.17246	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	0317297071
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-06-19 07:15:15.182115	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	0317297071
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-06-19 07:15:15.2715	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	0317297071
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-06-19 07:15:15.280393	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	0317297071
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-06-19 07:15:15.287516	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	0317297071
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-06-19 07:15:15.293475	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	0317297071
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-06-19 07:15:15.297947	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	0317297071
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-06-19 07:15:15.477967	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	0317297071
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-06-19 07:15:15.580582	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	0317297071
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-06-19 07:15:15.590695	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	0317297071
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-06-19 07:15:15.767386	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	0317297071
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-06-19 07:15:15.778821	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	0317297071
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-06-19 07:15:15.789293	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	0317297071
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-19 07:15:15.801326	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	0317297071
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-19 07:15:15.852637	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	0317297071
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-19 07:15:15.858382	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	0317297071
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-19 07:15:15.954864	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	0317297071
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-06-19 07:15:16.07476	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	0317297071
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-19 07:15:16.080925	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	0317297071
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-19 07:15:16.084122	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	0317297071
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-19 07:15:16.120165	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	0317297071
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-06-19 07:15:16.165832	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	0317297071
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-19 07:15:16.284935	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	0317297071
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-19 07:15:16.289559	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	0317297071
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-19 07:15:16.298924	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	0317297071
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-19 07:15:16.303181	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	0317297071
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-06-19 07:15:16.394663	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	0317297071
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-06-19 07:15:16.456675	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	0317297071
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-06-19 07:15:16.474605	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	0317297071
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-06-19 07:15:16.486487	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	0317297071
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.574592	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	0317297071
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.589121	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	0317297071
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.697349	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.755447	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	0317297071
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.75981	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	0317297071
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.774464	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	0317297071
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.779597	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	0317297071
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-06-19 07:15:16.796098	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	0317297071
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-19 07:15:17.163913	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-19 07:15:17.166756	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-19 07:15:17.189913	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-19 07:15:17.367972	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-19 07:15:17.371688	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-19 07:15:17.482488	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	0317297071
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-06-19 07:15:17.491544	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	0317297071
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-06-19 07:15:17.518614	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	0317297071
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-06-19 07:15:17.684864	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	0317297071
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-06-19 07:15:18.349888	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	0317297071
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-06-19 07:15:18.586241	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	0317297071
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-06-19 07:15:18.618043	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	0317297071
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-06-19 07:15:18.771834	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	0317297071
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-06-19 07:15:18.776603	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	0317297071
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-06-19 07:15:18.795138	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-06-19 07:15:18.865667	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	0317297071
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-06-19 07:15:18.885594	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	0317297071
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-06-19 07:15:18.891824	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	0317297071
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-06-19 07:15:18.903673	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	0317297071
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-06-19 07:15:18.95214	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	0317297071
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-06-19 07:15:18.964987	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	0317297071
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-06-19 07:15:18.974234	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	0317297071
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-19 07:15:19.489365	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	0317297071
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-19 07:15:19.517772	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	0317297071
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-19 07:15:19.571487	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-06-19 07:15:19.689115	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-06-19 07:15:19.69785	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	0317297071
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-06-19 07:15:19.716947	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-06-19 07:15:19.721922	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:19.771665	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:19.885972	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:21.769309	128	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:24.275292	129	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:26.568152	130	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:28.764532	131	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:28.768317	132	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:28.967266	133	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	0317297071
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:28.979975	134	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	0317297071
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:28.991557	135	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	0317297071
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:28.995536	136	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	0317297071
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-06-19 07:15:29.285832	137	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	0317297071
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:29.320768	138	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	0317297071
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:29.376354	139	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	0317297071
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:29.488468	140	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	0317297071
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:29.520653	141	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	0317297071
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:29.571121	142	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	0317297071
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:29.664829	143	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	0317297071
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:29.874572	144	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	0317297071
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:31.468024	145	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	0317297071
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:31.566653	146	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	0317297071
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-06-19 07:15:31.573888	147	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	0317297071
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-06-19 07:15:31.583427	148	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.29.1	\N	\N	0317297071
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-06-19 07:15:31.655948	149	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	0317297071
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-06-19 07:15:31.664706	150	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.29.1	\N	\N	0317297071
26.2.0-36750	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-06-19 07:15:31.675881	151	EXECUTED	9:b49ce951c22f7eb16480ff085640a33a	createTable tableName=SERVER_CONFIG		\N	4.29.1	\N	\N	0317297071
26.2.0-26106	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-06-19 07:15:31.683512	152	EXECUTED	9:b5877d5dab7d10ff3a9d209d7beb6680	addColumn tableName=CREDENTIAL		\N	4.29.1	\N	\N	0317297071
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
1c48905a-b826-47d5-8c26-a03f5a248c68	6c52d22b-1300-4e2e-bc2c-5a424b4f7a48	f
1c48905a-b826-47d5-8c26-a03f5a248c68	ba7c175a-ac34-4ad2-9114-04113c3ad176	t
1c48905a-b826-47d5-8c26-a03f5a248c68	265e8814-214f-4995-ba2b-963b0cbe3436	t
1c48905a-b826-47d5-8c26-a03f5a248c68	b13501b1-cf3b-420d-8f1d-fbba2fd50221	t
1c48905a-b826-47d5-8c26-a03f5a248c68	def6a430-0aca-44b7-af7e-7957e815a8cb	t
1c48905a-b826-47d5-8c26-a03f5a248c68	248380a2-9015-4dcf-9f18-807ada136213	f
1c48905a-b826-47d5-8c26-a03f5a248c68	eecdd1b9-366c-4a1f-996b-6c98df525ac3	f
1c48905a-b826-47d5-8c26-a03f5a248c68	a3f88191-1ad2-43b7-bc62-fd2904e862f5	t
1c48905a-b826-47d5-8c26-a03f5a248c68	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd	t
1c48905a-b826-47d5-8c26-a03f5a248c68	4e8cff58-e7df-4ab6-af1f-fc029dec2889	f
1c48905a-b826-47d5-8c26-a03f5a248c68	e1836b1b-decc-4c4b-889d-d08cd825c5ee	t
1c48905a-b826-47d5-8c26-a03f5a248c68	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a	t
1c48905a-b826-47d5-8c26-a03f5a248c68	ada5f296-7a5a-4f80-b839-25e1063155ea	f
98deb0a8-a0bc-4d66-9005-e0960be33c64	353f32af-3fea-4ea3-840e-f51d67620d47	f
98deb0a8-a0bc-4d66-9005-e0960be33c64	dfe1f3fe-2a77-47e9-b551-8bb3c833579e	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	40b4bb43-e046-4f79-8cf7-d4de210cd844	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	17ca2a77-61c1-4e6b-b33c-dcef39419bd8	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	c2ebd575-9497-4987-b5cc-62328a68b40f	f
98deb0a8-a0bc-4d66-9005-e0960be33c64	ef5e62ae-487b-4e42-8788-878b8ab60bd8	f
98deb0a8-a0bc-4d66-9005-e0960be33c64	4a89fcaf-6f02-486b-a6ef-933e7d2bd034	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	5040846b-e2aa-4623-bf8c-ad9f74c3dd78	f
98deb0a8-a0bc-4d66-9005-e0960be33c64	539a55bc-a41f-4f99-aa61-238efd8dafaa	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	2e23b5a1-79df-47ef-a87f-31026eb67719	t
98deb0a8-a0bc-4d66-9005-e0960be33c64	07632233-3098-443a-a651-07706c649104	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
b1ea3da8-e3b1-427a-9107-5c64ed6d4e12	1c48905a-b826-47d5-8c26-a03f5a248c68	f	${role_default-roles}	default-roles-master	1c48905a-b826-47d5-8c26-a03f5a248c68	\N	\N
1351c47e-6862-4e2f-a309-60fb75869633	1c48905a-b826-47d5-8c26-a03f5a248c68	f	${role_create-realm}	create-realm	1c48905a-b826-47d5-8c26-a03f5a248c68	\N	\N
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	1c48905a-b826-47d5-8c26-a03f5a248c68	f	${role_admin}	admin	1c48905a-b826-47d5-8c26-a03f5a248c68	\N	\N
ff1a65ca-2e7b-4429-94f8-f580828f3fd3	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_create-client}	create-client	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
9f0d6d59-7b2c-44a9-80c9-8c501946366b	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_view-realm}	view-realm	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
787585f0-9e70-4d6f-b7f8-a3c3d3a90eeb	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_view-users}	view-users	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
d96bd495-115a-438b-ac76-b143c3f83e6f	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_view-clients}	view-clients	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
c91f3abe-9af6-4d8d-a835-aa1c03dc733d	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_view-events}	view-events	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
89b265a2-9c59-45c3-87a5-d3fc8687dcf1	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_view-identity-providers}	view-identity-providers	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
8fc7c801-4fb8-4fbd-8ec1-9833ed9cb0b1	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_view-authorization}	view-authorization	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
bbfbe6f5-852d-46b7-9116-d5e85cad9de1	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_manage-realm}	manage-realm	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
4161579d-383c-42cc-9bc3-8598fc6c5389	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_manage-users}	manage-users	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
3808d215-74e1-4c9e-afea-078e250b247d	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_manage-clients}	manage-clients	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
784e7640-3cca-4dee-87e0-3d6a12606bc4	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_manage-events}	manage-events	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
4d6c6951-8f7c-47d6-8590-507fa8f831e2	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_manage-identity-providers}	manage-identity-providers	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
8d64573a-13a9-4bb8-bfaf-6c570c32e6b3	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_manage-authorization}	manage-authorization	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
66f368a1-10e6-4f56-83fd-162417b29193	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_query-users}	query-users	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
db4fede8-8c1e-4458-9854-fcd1fe0edad9	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_query-clients}	query-clients	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
4b60a2a1-c925-4344-ba51-45a8eda96353	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_query-realms}	query-realms	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
3d4b91f8-1d0d-46bb-b58e-0624649fe756	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_query-groups}	query-groups	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
710c5141-64d8-4510-ab95-30c5fbb554fe	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_view-profile}	view-profile	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
6fc23fa0-7dfe-46dd-834c-802f56720692	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_manage-account}	manage-account	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
00c93105-1404-485d-a83c-9820073ae4fe	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_manage-account-links}	manage-account-links	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
59f0c23b-ec6f-4a7b-bd1b-5dc14c55a86a	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_view-applications}	view-applications	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
1e5bddfb-26cf-4332-beb1-36b2f945ed12	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_view-consent}	view-consent	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
9461857b-5420-4be8-97a8-2ad954ddb5fa	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_manage-consent}	manage-consent	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
e536c814-8b9c-493e-bfb0-b51151bc3c56	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_view-groups}	view-groups	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
998e8c4e-767d-410c-9e4a-2153f919d633	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	t	${role_delete-account}	delete-account	1c48905a-b826-47d5-8c26-a03f5a248c68	deb3cf8d-fa1e-456c-88a7-e2693fe18e84	\N
3eb447c2-5607-4bf6-bf5c-92d79e6532f5	a712f7e5-0901-489c-82c7-7f88b7fa5e42	t	${role_read-token}	read-token	1c48905a-b826-47d5-8c26-a03f5a248c68	a712f7e5-0901-489c-82c7-7f88b7fa5e42	\N
26607b5c-50bd-49aa-9ac9-340dd3a26c15	0b9a450b-01db-4cd3-a6fd-08385c9ac602	t	${role_impersonation}	impersonation	1c48905a-b826-47d5-8c26-a03f5a248c68	0b9a450b-01db-4cd3-a6fd-08385c9ac602	\N
e34c9786-192e-4122-b406-089332419ce1	1c48905a-b826-47d5-8c26-a03f5a248c68	f	${role_offline-access}	offline_access	1c48905a-b826-47d5-8c26-a03f5a248c68	\N	\N
49d9e087-1ea4-47e4-9fcb-1799ea6791c5	1c48905a-b826-47d5-8c26-a03f5a248c68	f	${role_uma_authorization}	uma_authorization	1c48905a-b826-47d5-8c26-a03f5a248c68	\N	\N
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	98deb0a8-a0bc-4d66-9005-e0960be33c64	f	${role_default-roles}	default-roles-kaist	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N	\N
5236ded2-717b-4cc8-8e7f-9335d0618c46	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_create-client}	create-client	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
a8764657-7fae-4b9b-8c5f-86c921ee1ba5	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_view-realm}	view-realm	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
f64416e3-eb4a-4361-b24c-49b6b1a1f295	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_view-users}	view-users	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
91b792c5-4c4c-4376-94db-5ea8326898ca	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_view-clients}	view-clients	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
d49766c5-ff46-4e60-bb5a-fbd7c0ff1976	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_view-events}	view-events	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
3e5005dd-43c1-4389-8cc6-364b14d4e0e4	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_view-identity-providers}	view-identity-providers	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
0fb3fe54-ecec-4a8c-ace5-f8d83feb5af1	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_view-authorization}	view-authorization	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
96a88100-3320-4723-bc44-f0e5e960c03f	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_manage-realm}	manage-realm	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
c3ee17ce-105b-40fd-abad-f474a178ca8e	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_manage-users}	manage-users	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
47c30498-0b84-4be3-bb4b-28821ffab0f5	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_manage-clients}	manage-clients	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
38977c12-c601-41c5-8fad-568b83dbcfb3	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_manage-events}	manage-events	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
339e3bac-b554-408d-aa74-5f5b09b0f2c7	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_manage-identity-providers}	manage-identity-providers	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
7741fde6-9132-4017-9a0f-eead6239f445	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_manage-authorization}	manage-authorization	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
b79eb8ef-37b7-4816-a4cf-e64e9dcd4f61	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_query-users}	query-users	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
3a1fe55d-e8c9-46e4-a45a-9a930306e879	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_query-clients}	query-clients	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
d9412572-7380-44b7-8e4d-bbebd0fe3e01	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_query-realms}	query-realms	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
adad7302-5a28-425b-aa67-f5d375a8c61a	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_query-groups}	query-groups	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
ae6e867c-83c8-435e-a121-45429a1feb9f	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_realm-admin}	realm-admin	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
44412e86-f8a4-4c22-9f55-131fc54fda73	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_create-client}	create-client	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
cf1dd76c-b0a7-47aa-9870-79ab1381b419	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_view-realm}	view-realm	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
7b67eb31-b785-4854-a7e2-406205fce8d0	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_view-users}	view-users	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
4b5ff577-2d9b-42f5-a41c-ff131b41e434	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_view-clients}	view-clients	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
f8c02989-35fc-4bee-be4a-3232d31ea621	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_view-events}	view-events	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
6ca06103-ddb8-45d2-a3ae-16f735c90a29	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_view-identity-providers}	view-identity-providers	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
87d12e42-58d4-4ea6-9b5d-6330056a6c04	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_view-authorization}	view-authorization	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
da333cca-84ef-4d1b-9c7f-bfd6b7b1e7d2	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_manage-realm}	manage-realm	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
488afd52-ec70-4d4e-a87e-8f872b59983a	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_manage-users}	manage-users	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
31a53807-20ba-4b2b-b645-4252670a492f	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_manage-clients}	manage-clients	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
f871de57-288d-4c55-96ec-1f0114442efe	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_manage-events}	manage-events	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
1cab6341-3028-4021-a636-487fcf4ca4ef	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_manage-identity-providers}	manage-identity-providers	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
a5cca8f4-5b9f-48ac-92da-156b13b7c5a8	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_manage-authorization}	manage-authorization	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
f14be8be-f6e1-4832-8ac2-adbf9356e1c6	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_query-users}	query-users	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
c612dcef-ecaf-48b7-94a2-153e7bdfc5d6	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_query-clients}	query-clients	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
cd44c42e-cd12-43f1-910c-6660be142b2e	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_query-realms}	query-realms	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
dbe5824a-123c-4de3-ab64-4c809ecb4424	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_query-groups}	query-groups	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
c6f165e8-3418-4f72-a55a-cef554957f3e	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_view-profile}	view-profile	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
01c3804d-d393-4a9e-a8ca-904e71f93ce7	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_manage-account}	manage-account	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
199ff76d-4d3e-4f9b-910e-d411d495e714	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_manage-account-links}	manage-account-links	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
024802fe-a384-43f1-aa5c-ffbb03c9f487	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_view-applications}	view-applications	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
f4af7a74-cef3-41a8-be27-e3ac65d04cc2	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_view-consent}	view-consent	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
6e04d2fb-1b45-4873-be89-cb9e02eecac5	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_manage-consent}	manage-consent	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
05363fb5-cb59-4774-aa56-8003f10c1baf	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_view-groups}	view-groups	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
1532ae11-2756-4855-a0b9-255ac53b2c7d	50ad5921-986f-4afb-ae73-e5e652a3de8d	t	${role_delete-account}	delete-account	98deb0a8-a0bc-4d66-9005-e0960be33c64	50ad5921-986f-4afb-ae73-e5e652a3de8d	\N
8a53d96b-0c54-4953-9a26-e7e704dc7ba1	ea8b9ce7-318c-467e-bc99-85d8f7e99343	t	${role_impersonation}	impersonation	1c48905a-b826-47d5-8c26-a03f5a248c68	ea8b9ce7-318c-467e-bc99-85d8f7e99343	\N
8c807cf0-739f-4396-9aaa-ca22851e39e1	1d78f604-cf59-4a12-8688-ab8c56ea08b4	t	${role_impersonation}	impersonation	98deb0a8-a0bc-4d66-9005-e0960be33c64	1d78f604-cf59-4a12-8688-ab8c56ea08b4	\N
027a5ff0-6536-49cc-aab2-11040fe5aeca	4e6a4fd2-6f90-44be-b941-d3741cda76ac	t	${role_read-token}	read-token	98deb0a8-a0bc-4d66-9005-e0960be33c64	4e6a4fd2-6f90-44be-b941-d3741cda76ac	\N
9bc9fbe8-8e84-45ab-a8e5-a3f68948aa79	98deb0a8-a0bc-4d66-9005-e0960be33c64	f	${role_offline-access}	offline_access	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N	\N
f5124edc-22ab-4699-8e49-66c5ec9868c0	98deb0a8-a0bc-4d66-9005-e0960be33c64	f	${role_uma_authorization}	uma_authorization	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N	\N
914ea730-0919-458e-a991-8806296ee7df	9c9fff21-cf5c-4db2-8de6-b14f7a80660f	t	\N	uma_protection	98deb0a8-a0bc-4d66-9005-e0960be33c64	9c9fff21-cf5c-4db2-8de6-b14f7a80660f	\N
4d258f42-372f-4798-898a-619aef5263c3	ff26ec34-886e-4d94-904c-0282b67a4cc4	t	\N	uma_protection	98deb0a8-a0bc-4d66-9005-e0960be33c64	ff26ec34-886e-4d94-904c-0282b67a4cc4	\N
addcc8a6-0034-46f9-a320-9500b998a79b	98deb0a8-a0bc-4d66-9005-e0960be33c64	f		kaist-admin	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N	\N
eddf40aa-2d0f-4b3a-a646-2e37bf9ba684	98deb0a8-a0bc-4d66-9005-e0960be33c64	f		jupyter-admins	98deb0a8-a0bc-4d66-9005-e0960be33c64	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
npoyc	26.2.5	1750317344
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
14f73a32-b58e-4f1b-92e2-8fbfab160552	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752643703	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752643703","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752643703","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"ShqrueVwCDImwizszqgeg1eE7YVx4P","nonce":"cPDxywiiLpzUbgXV3RTN"}}	local	local	0
00a377f4-bd59-4a5c-88fe-6148c63a1705	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752645742	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752645742","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752645742","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"3prqevC2LianwAb4p8iN6wLUC7XCqW","nonce":"54dMjYoQh4xrfHxyonjE"}}	local	local	0
cfe24d1c-a140-42f3-ad23-f343b9eb54d6	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752644163	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752644011","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752644011","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"dIEuCY1b4s5gOQw15gF5aJcqIfvhXC","nonce":"9ZSeGoti5fTC5Wzw8x2U","SSO_AUTH":"true"}}	local	local	2
d1426261-58fe-4d66-8997-6c5ed2114130	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752644237	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752644237","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752644237","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"Bnkn8AJgsa1NE9XO5iW7GnqJ3QFb0Q","nonce":"RXbKAlXltqtUl3OHj0eS"}}	local	local	0
3df84953-a5f6-431a-b4ae-580d27de2a8f	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752644296	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752644296","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752644296","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"uf7HWxPxK4ecYLVGG611EDCw2G1FUN","nonce":"tjS2OTUsLOLjnyqmjpt7"}}	local	local	0
186f9618-1224-4f1c-a824-a30321e7e334	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752644597	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752644597","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752644597","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"bVE2GtOQCDXmwE5uWgHlYOHzgNCuw4","nonce":"QX0BHPUG6sYexduY18dB"}}	local	local	0
ffd232e2-369c-42b0-8fe2-797a9f555923	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752644681	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752644681","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752644681","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"O3AzswQmyDEZXhkXw9z4uJySlq56d8","nonce":"sDBtg9vKBbE9iGuY6yLX"}}	local	local	0
2f54f05a-3398-49bc-9f9b-93d9a0ffc0d5	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752645036	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752645036","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752645036","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"KKXHy6BZFewVTD1bBFLkEuhhDBBscD","nonce":"Pc7jY88dMKxZnUUrzfq6"}}	local	local	0
ef9df00e-d3a4-4a20-b0a6-81ff9dc19a9e	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752645481	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752645481","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752645481","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"svNS9yAe0LAhBV6SiwmkbucELJwE5j","nonce":"Wcpk0z0utW0SRACCSTbS"}}	local	local	0
15a2b39c-80e1-4a50-ac43-8e7276695f49	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752645827	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752645827","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752645827","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"PFQNgabHPo94ySGoQBjtPLQ6uvG5G7","nonce":"5MRFe3OqLPrDQi1Iyswf"}}	local	local	0
39d7014a-98a1-4a9c-91dc-508d6b316691	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752646199	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752646198","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752646198","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"XxJLDmnNAGLjiM4gC4IZBcMHZpE6Gi","nonce":"qIaEmyu4LAImobPspKK4"}}	local	local	1
eeb5e03f-c204-482d-9857-21451921b20b	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752651015	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752643670","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752643670","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"eWVVe0aEpYpn6mKln2UvH1K5dt5cTK","nonce":"g1AsvUNEeugBjsSqsIbr"}}	local	local	1
c16c4d63-5bab-486b-831b-87d4f92fa8fe	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752647237	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752647237","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752647237","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"eRA4Wn3lcNczzu3onkzEpms421QAMW","nonce":"TYsCxpLRVwTzb9wJ6kaj"}}	local	local	0
fc5a7ff9-0dcc-46a4-82d4-3105c7b5e8b0	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752656340	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752647080","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752647080","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"vrLaFdIwCA7a7wpCdzF0P4DloMXuHT","nonce":"zQiP6mCOMvQ9RECfYqes"}}	local	local	2
966518da-1b94-4fdf-a560-eb24b8726ad4	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752647584	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752647584","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752647584","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"v6ckqTuv5EDEejMv40cKKlVRpYbKIu","nonce":"EWMFaVGv1UIY8bKN5hlK"}}	local	local	0
34ded864-10d4-4288-84d0-edf58f29c033	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752648206	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752648206","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752648206","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"a09sW7aQMdaGw5ohBqNj5cyPemEFgY","nonce":"GK20fErPV035xMa3a7ay"}}	local	local	0
4b2c4931-de43-4c13-b248-97044cb556b4	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752648516	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752648516","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752648516","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"YNoZNdu069krTMORUUS69fZ023VYkt","nonce":"YSD19oyQXAvOUydr8SA8"}}	local	local	0
88636a77-3bb3-41d4-82e3-b50cf4275571	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752649181	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752649181","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752649181","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"yyFGOAWpMQfAWE9DiU1H9ZNdq66zER","nonce":"2sAm7dcOS66sfBeAvGWN"}}	local	local	0
803ada3a-e094-45b6-91f2-720beb6fb8b5	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752627238	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752627237","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752627237","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"cW6kC9xXRPlwpTYrKVWOk9OELjV2Dj","nonce":"cxVgBACd87AUQFVht7In"}}	local	local	1
26e34f5b-5147-475f-9095-a9e34374f6b1	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752639440	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752626541","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752626541","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"ZBAG76tdIX39a5UAjbuLJqzAoqOuvd","nonce":"FqG94AA5UdYTzVUzeUv9","SSO_AUTH":"true"}}	local	local	3
36c45730-c600-423f-84d8-652e4a0507d7	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752650810	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752650806","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752650806","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"w7d1dEChzNgK3M51w6UVlEvelIUzZN","nonce":"7KqnaFnqE7zkPuONiCJY","SSO_AUTH":"true"}}	local	local	1
3b20dfc6-5f52-4680-aed9-2cf91a7f3fc5	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752650814	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752650814","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752650814","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"LUaE914JW99ioCfYIa5A01JmfsmJGz","nonce":"BwdzlTe52WxHddCrd0oi"}}	local	local	0
52524471-0fe1-4499-84f4-d4d2dc0c04cc	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752629880	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752629879","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752629880","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"rVltz9lfWuqxG6u0lkQANGGzd8I4V2","nonce":"lQ1G9TEqhLdVgvokn82N"}}	local	local	0
65b9ba1e-8a1f-40c6-8f19-a2bddaef730d	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752629932	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752629932","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752629932","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"NKXmXLlUXiXwLsQVhv4PRVaFa5R6eu","nonce":"6gOXCjBR06jxsDMkNeos"}}	local	local	0
54f00a0f-9502-406c-80d1-681796aecf3c	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752629964	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752629964","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752629964","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"wMsxT1WDwDtTeDnzUw1rPpwMbFoBDm","nonce":"jDqEmSwcCsPCwhPxg74W"}}	local	local	0
ade59e9d-7b51-4645-8a55-49049479ef47	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752654320	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"login_hint":"kyeun1@naver.com","clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752654320","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752654320","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"XcvEXZuQX9GkxmvL1AVA8ea3gN2P70","nonce":"HDg2GFynEmhW1vL3nkee"}}	local	local	0
21af89e0-148e-46c1-98b1-80ca71306e4e	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752630751	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752630751","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752630751","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"RMm3XDOG5yjoqsHSIXL1rpln9x6CWQ","nonce":"FAaeULx7QznHfQM5tWLn"}}	local	local	0
338ec952-258f-4c3f-be00-06b3357543da	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752647358	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752632304","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752632304","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"wPRKM0d084hDmebxVO0Vtd311gbKc2","nonce":"ms7GI5I6rbDfMPkoBXSs"}}	local	local	1
cdb42335-f1c9-4a76-8c59-82c663066632	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752655751	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752655751","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752655751","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"xU5LsupqDxjNjpG21jn4I7buc766Bu","nonce":"NaHo9Oj3yn0Haxcc9mgx"}}	local	local	0
43f01ccf-2b3f-4993-9664-b9f371122c32	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752632000	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752632000","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752632000","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"0ANdX3DalXZtXPMAcFvRuV0fT9bibL","nonce":"Q0MhgmDPLriM8COBpPsO"}}	local	local	0
c5693243-ab85-4a7f-bb07-05299d5cda65	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752639322	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752632084","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752632084","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"5Fj8mPvqGmxM5SGmdseg0ocxoGQjLb","nonce":"Fl2lXDM0ZhcRc1NaTbkf"}}	local	local	1
68caf338-7245-4957-a2cb-cda154767ead	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752641504	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752631513","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752631513","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"1u6vS5r20q6armVUJ7dh70Yyx7T6a8","nonce":"BV27ZXx5pXo2ByFpKeXt"}}	local	local	2
61ee77df-7415-4ce4-82d5-11d003080af7	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752632728	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752632728","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752632728","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"HXljaQ6pPZ9cnoanCF18g5jLQK4toy","nonce":"RQwzwbLqvhi6hOHNPgo1"}}	local	local	0
5913d9ca-0455-49a1-8ac9-3de8ad6f2a48	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752656197	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752656197","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752656197","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"Q0EhTCsxvkw6ifvB1cbBEyrEhDmYfD","nonce":"jRkDWHiEF0xJbjDdJCZv"}}	local	local	0
dfd74d3f-bbb2-4163-b4bd-7cd7d0c25116	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752635435	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752635435","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752635435","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"ssZyJhbU8SXAkKrKQR2PtxTsZUF2UY","nonce":"fXVsAOluNzcE6IXZ2mEH"}}	local	local	0
2dfac033-b29e-429d-b8a0-ce5218db0b77	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752635591	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752635591","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752635591","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"feLqNuMwC3kDE61DkfhGZ0c5vfvp32","nonce":"H8bvWqhFOx5RkQPI3XTf"}}	local	local	0
8bb45aeb-dcd2-404b-b1d2-a8b2a720a10e	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752635715	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752635715","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752635715","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"Q2ZEQJAzIu2TX9c0coUW9GDT1fX5fl","nonce":"kSVQSTOE6JvemTYL03gx"}}	local	local	0
d84ebbb5-3a87-4b72-9eec-7790d84fe26a	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752648527	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752635240","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752635240","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"0PKt65JNNSQOtm7Dcep8uqDcB3PIqP","nonce":"taLITd066PAuFsy5ITzC"}}	local	local	1
657a6afe-55c7-4ec6-bc6a-cef56b6514c3	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752652359	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752634760","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752634760","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"aX1WKLNS7TG71dSbq3IkQ1ztcsgYNs","nonce":"MCQOk37BCEMngPr333m4"}}	local	local	1
8cb13057-a0b7-4458-b79e-98fa30e2ac82	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752638755	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752638755","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752638755","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"QH3bJxQwGrGLq62AuoQhHTI7oPSadQ","nonce":"4Ajar7NSwoGIthHK7SkV"}}	local	local	0
a4994a5b-b6f9-4c74-9fba-ea16d9d384d3	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752639073	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752639073","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752639073","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"7X3hEhmMdL88XOM9SaVnJMiUuXZL0H","nonce":"tcKhZ2jAxCHvoGJiz2EI"}}	local	local	0
58c26665-f17f-475d-b836-e36f2d8994f3	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752639241	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752639241","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752639241","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"Cw5nGjBmcPetKCL92WSsmH60k7U3rl","nonce":"4JqEyTkQ4Yy8qKuO8ZZQ"}}	local	local	0
f4590f28-c996-474d-9c70-989dbf910def	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752640073	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752640073","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752640073","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"p1UKXwFwOmqVQfFyF60HefK4kZ3GKe","nonce":"bT8DfFtf7F1BaX4YCeqa"}}	local	local	0
34d2db6e-2267-429f-a917-ceca224c4690	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752640267	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752640267","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752640267","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"Uj5LXR3dNjHriFJgLFYnjPCk66JW1J","nonce":"ig265UFzE6ghkkdm7N1M"}}	local	local	0
42fd2447-5b67-466e-b9d8-22cd279e0cf1	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752653789	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752638227","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752638227","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"6BcSdkCS5iZGW6wKrF9KrqZhtQI8AQ","nonce":"bWXK4qSijsgZq52ReBQ3"}}	local	local	2
6da67671-c3f5-4169-9859-8d7f4f317b48	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752641711	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752641711","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752641711","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"e3g9logifZdAk1cjIpZiAGfyH1MhPE","nonce":"lR5Cty2QXYskwh2fjXRv"}}	local	local	0
d42551ed-a9ea-47c8-adc6-47a0553ec617	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752641778	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752641778","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752641778","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"xFfqml40Oqzuhd8WBdwaBfDibvDpfE","nonce":"e2znfXNw0lzjSm4jZCJ8"}}	local	local	0
80cf10a1-a204-470b-abe2-02814cf6954c	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752642060	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752642060","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752642060","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"dmZGknfvnw4mOGHlQSOH6P923fD6Md","nonce":"9fE1HyZrorOTqWDxx5Q4"}}	local	local	0
0dad9409-ff1c-4e4b-bdad-612150d8b4a6	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752642113	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752642113","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752642113","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"a1PLhWgLdSJUr3DMCAOGy3vV6XzGVr","nonce":"YGRadDjshJNmiZ6lQ5QF"}}	local	local	0
32b0ef5a-9afe-4fb1-aaa1-43199b9ca591	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752642786	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752642785","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752642785","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"QK9NUQB3KRvQ3JIxROsp6zG6ffiYKk","nonce":"iWvIW8QO2tw3JKQqP4EA"}}	local	local	1
a652dd66-d79e-4fe3-a32a-0a8a7f6fd235	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752642277	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752642277","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752642277","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"0BCA0JzFSuDjz4gvpkpiMTsaD8sO4K","nonce":"maHuG3E0HVDeDTHaYpjl"}}	local	local	0
0b1a438f-0c77-4516-8c36-bf1a2b28f128	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752643032	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752643032","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752643032","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"F0KZWGSZ9yC94vVuBQHAIAkypPfvsY","nonce":"qReuApKlhERZv0AtFTLi"}}	local	local	0
d84360d5-6596-4759-b1b3-f0f47a859688	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752642386	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752642386","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752642386","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"m41Q2WPmBdyKq2a6dtJDOFOE1bYedg","nonce":"yZKwUTZjbCdDUUwFWE7G"}}	local	local	0
109a1e37-beb8-4dc6-a400-dfb2b0b2088c	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752642739	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752642738","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752642738","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"J0RUsmNDaLb1rbUBPMqNz43eVoklAf","nonce":"IYhZa6Yq3ZzZYZmm2ydu"}}	local	local	1
77d6852a-6548-4330-8d26-1ca2b0461929	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752655211	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752641527","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752641527","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"dWyuDc31QBlKi7fqlYiHfmrjacCBKf","nonce":"1NHNnyeZ1eF24xTppvAy"}}	local	local	1
1ba21317-41ea-4711-b288-70182bc786d6	ff26ec34-886e-4d94-904c-0282b67a4cc4	0	1752643121	{"authMethod":"openid-connect","redirectUri":"https://kasiai.kaist.ac.kr/api/callback","notes":{"clientId":"ff26ec34-886e-4d94-904c-0282b67a4cc4","scope":"openid email profile","userSessionStartedAt":"1752643091","iss":"https://kasiaiauth.kaist.ac.kr/realms/KAIST","startedAt":"1752643091","response_type":"code","level-of-authentication":"-1","redirect_uri":"https://kasiai.kaist.ac.kr/api/callback","state":"YKEYSHG1D576DnwRPT5JTSJtY8umIF","nonce":"d4QBkPvYGR6Epoji0VW3","SSO_AUTH":"true"}}	local	local	2
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
54f00a0f-9502-406c-80d1-681796aecf3c	a1c2b840-08df-4398-be4e-e59514183896	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752629964	0	{"ipAddress":"203.246.0.254","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMDMuMjQ2LjAuMjU0Iiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752629964","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752629964}"},"state":"LOGGED_IN"}	1752629964	\N	0
61ee77df-7415-4ce4-82d5-11d003080af7	96db1114-75e1-4a83-a16f-f8dcf76ed677	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752632728	0	{"ipAddress":"203.255.82.2","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMDMuMjU1LjgyLjIiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJFZGdlLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752632728","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752632728}"},"state":"LOGGED_IN"}	1752632728	\N	0
dfd74d3f-bbb2-4163-b4bd-7cd7d0c25116	a85c5cd0-ae81-45c4-b0ac-4885f9ef46c1	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752635435	0	{"ipAddress":"182.230.190.156","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxODIuMjMwLjE5MC4xNTYiLCJvcyI6ImlPUyIsIm9zVmVyc2lvbiI6IjE4LjUiLCJicm93c2VyIjoiTW9iaWxlIFNhZmFyaS8xOC41IiwiZGV2aWNlIjoiaVBob25lIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjp0cnVlfQ==","AUTH_TIME":"1752635435","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752635435}"},"state":"LOGGED_IN"}	1752635435	\N	0
2dfac033-b29e-429d-b8a0-ce5218db0b77	be1b8b0f-4467-4fb6-8aa0-f3bf31bc1d55	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752635591	0	{"ipAddress":"124.5.95.24","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjQuNS45NS4yNCIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752635591","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752635591}"},"state":"LOGGED_IN"}	1752635591	\N	0
8bb45aeb-dcd2-404b-b1d2-a8b2a720a10e	ef869940-2e2b-43be-b15d-dd54c4862a90	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752635715	0	{"ipAddress":"163.180.171.73","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNjMuMTgwLjE3MS43MyIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752635715","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752635715}"},"state":"LOGGED_IN"}	1752635715	\N	0
8cb13057-a0b7-4458-b79e-98fa30e2ac82	c0125d7c-f131-4eb0-b81b-bfb2c63a4b10	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752638755	0	{"ipAddress":"220.87.59.200","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMjAuODcuNTkuMjAwIiwib3MiOiJNYWMgT1MgWCIsIm9zVmVyc2lvbiI6IjEwLjE1LjciLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJNYWMiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752638755","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752638755}"},"state":"LOGGED_IN"}	1752638755	\N	0
a4994a5b-b6f9-4c74-9fba-ea16d9d384d3	96db1114-75e1-4a83-a16f-f8dcf76ed677	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752639073	0	{"ipAddress":"116.39.250.17","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTYuMzkuMjUwLjE3Iiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752639073","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752639073}"},"state":"LOGGED_IN"}	1752639073	\N	0
58c26665-f17f-475d-b836-e36f2d8994f3	2bf7f5bd-82e6-4764-860f-247f774e5c59	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752639241	0	{"ipAddress":"163.180.171.133","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNjMuMTgwLjE3MS4xMzMiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752639241","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752639241}"},"state":"LOGGED_IN"}	1752639241	\N	0
338ec952-258f-4c3f-be00-06b3357543da	ed137331-a9f0-4e84-b3b3-0ed5e026484d	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752632304	0	{"ipAddress":"121.167.146.119","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjEuMTY3LjE0Ni4xMTkiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752632304","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752632304}"},"state":"LOGGED_IN"}	1752647358	\N	1
d84ebbb5-3a87-4b72-9eec-7790d84fe26a	493967e2-5d44-4046-b93b-d49990fb9358	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752635240	0	{"ipAddress":"223.38.85.84","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMjMuMzguODUuODQiLCJvcyI6ImlPUyIsIm9zVmVyc2lvbiI6IjE4LjUiLCJicm93c2VyIjoiTW9iaWxlIFNhZmFyaS8xOC41IiwiZGV2aWNlIjoiaVBob25lIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjp0cnVlfQ==","AUTH_TIME":"1752635240","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752635240}"},"state":"LOGGED_IN"}	1752648527	\N	1
657a6afe-55c7-4ec6-bc6a-cef56b6514c3	395739de-af2b-4b32-ba80-36da99d6b0d2	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752634760	0	{"ipAddress":"143.248.69.127","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNDMuMjQ4LjY5LjEyNyIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzcuMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752634760","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752634760}"},"state":"LOGGED_IN"}	1752652359	\N	1
42fd2447-5b67-466e-b9d8-22cd279e0cf1	fa5e48e6-ce1d-43df-a401-735dff7e58b7	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752638227	0	{"ipAddress":"121.167.146.119","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjEuMTY3LjE0Ni4xMTkiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752638227","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752638227}"},"state":"LOGGED_IN"}	1752653789	\N	2
21af89e0-148e-46c1-98b1-80ca71306e4e	c0125d7c-f131-4eb0-b81b-bfb2c63a4b10	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752630751	0	{"ipAddress":"118.235.15.238","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTguMjM1LjE1LjIzOCIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752630751","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752630751}"},"state":"LOGGED_IN"}	1752630751	\N	0
43f01ccf-2b3f-4993-9664-b9f371122c32	523b61ff-99d5-453a-a2ec-487ae0f1c552	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752632000	0	{"ipAddress":"122.43.71.98","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjIuNDMuNzEuOTgiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752632000","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752632000}"},"state":"LOGGED_IN"}	1752632000	\N	0
26e34f5b-5147-475f-9095-a9e34374f6b1	96db1114-75e1-4a83-a16f-f8dcf76ed677	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752626541	0	{"ipAddress":"1.246.226.53","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxLjI0Ni4yMjYuNTMiLCJvcyI6IkxpbnV4Iiwib3NWZXJzaW9uIjoiVW5rbm93biIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752626541","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752626540,\\"28013791-89b3-4245-aae7-292a4b968494\\":1752626587}"},"state":"LOGGED_IN"}	1752639440	\N	3
68caf338-7245-4957-a2cb-cda154767ead	27f2d557-ea6c-4967-a1a4-eb4c7ec530fa	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752631513	0	{"ipAddress":"182.221.145.248","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxODIuMjIxLjE0NS4yNDgiLCJvcyI6ImlPUyIsIm9zVmVyc2lvbiI6IjE4LjUuMCIsImJyb3dzZXIiOiJDaHJvbWUgTW9iaWxlIGlPUy8xMzguMC43MjA0IiwiZGV2aWNlIjoiaVBob25lIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjp0cnVlfQ==","AUTH_TIME":"1752631513","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752631513}"},"state":"LOGGED_IN"}	1752641504	\N	2
803ada3a-e094-45b6-91f2-720beb6fb8b5	395739de-af2b-4b32-ba80-36da99d6b0d2	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752627237	0	{"ipAddress":"143.248.94.41","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNDMuMjQ4Ljk0LjQxIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752627237","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752627237}"},"state":"LOGGED_IN"}	1752627238	\N	1
52524471-0fe1-4499-84f4-d4d2dc0c04cc	7fcc687a-c5e7-41d2-ada0-1df63a51880e	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752629879	0	{"ipAddress":"218.235.172.214","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMTguMjM1LjE3Mi4yMTQiLCJvcyI6ImlPUyIsIm9zVmVyc2lvbiI6IjE4LjUuMCIsImJyb3dzZXIiOiJDaHJvbWUgTW9iaWxlIGlPUy8xMzEuMC42Nzc4IiwiZGV2aWNlIjoiaVBob25lIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjp0cnVlfQ==","AUTH_TIME":"1752629880","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752629879}"},"state":"LOGGED_IN"}	1752629880	\N	1
65b9ba1e-8a1f-40c6-8f19-a2bddaef730d	e9e94382-f6c7-4ee6-b3c0-676ff233b9f2	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752629932	0	{"ipAddress":"175.122.66.126","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzUuMTIyLjY2LjEyNiIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752629932","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752629932}"},"state":"LOGGED_IN"}	1752629932	\N	0
c5693243-ab85-4a7f-bb07-05299d5cda65	ef869940-2e2b-43be-b15d-dd54c4862a90	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752632084	0	{"ipAddress":"163.180.171.134","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNjMuMTgwLjE3MS4xMzQiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752632084","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752632084}"},"state":"LOGGED_IN"}	1752639322	\N	1
f4590f28-c996-474d-9c70-989dbf910def	f80339de-5607-4b05-9728-3fce984c7eee	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752640073	0	{"ipAddress":"211.107.228.164","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMTEuMTA3LjIyOC4xNjQiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJXaGFsZS80LjMyLjMxNSIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752640073","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752640073}"},"state":"LOGGED_IN"}	1752640073	\N	0
34d2db6e-2267-429f-a917-ceca224c4690	395739de-af2b-4b32-ba80-36da99d6b0d2	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752640267	0	{"ipAddress":"143.248.94.41","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNDMuMjQ4Ljk0LjQxIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752640267","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752640267}"},"state":"LOGGED_IN"}	1752640267	\N	0
6da67671-c3f5-4169-9859-8d7f4f317b48	7fcc687a-c5e7-41d2-ada0-1df63a51880e	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752641711	0	{"ipAddress":"218.235.172.214","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMTguMjM1LjE3Mi4yMTQiLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752641711","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752641711}"},"state":"LOGGED_IN"}	1752641711	\N	0
d42551ed-a9ea-47c8-adc6-47a0553ec617	88bf5eae-b6d8-4d9c-a1ee-c161c74ea564	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752641778	0	{"ipAddress":"14.6.160.194","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNC42LjE2MC4xOTQiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752641778","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752641778}"},"state":"LOGGED_IN"}	1752641778	\N	0
80cf10a1-a204-470b-abe2-02814cf6954c	523b61ff-99d5-453a-a2ec-487ae0f1c552	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752642060	0	{"ipAddress":"106.101.139.28","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMDYuMTAxLjEzOS4yOCIsIm9zIjoiaU9TIiwib3NWZXJzaW9uIjoiMTguNS4wIiwiYnJvd3NlciI6IkNocm9tZSBNb2JpbGUgaU9TLzEzOC4wLjcyMDQiLCJkZXZpY2UiOiJpUGhvbmUiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOnRydWV9","AUTH_TIME":"1752642060","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752642060}"},"state":"LOGGED_IN"}	1752642060	\N	0
0dad9409-ff1c-4e4b-bdad-612150d8b4a6	d7333d22-42ea-4b35-9def-7fe0d2c59fd1	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752642113	0	{"ipAddress":"140.248.29.3","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNDAuMjQ4LjI5LjMiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJTYWZhcmkvMTcuMiIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752642113","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752642113}"},"state":"LOGGED_IN"}	1752642113	\N	0
a652dd66-d79e-4fe3-a32a-0a8a7f6fd235	ec86151d-ca0c-4a7b-b2e2-b648fabd5216	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752642277	0	{"ipAddress":"165.132.5.151","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNjUuMTMyLjUuMTUxIiwib3MiOiJNYWMgT1MgWCIsIm9zVmVyc2lvbiI6IjEwLjE1LjciLCJicm93c2VyIjoiV2hhbGUvNC4zMS4zMDQiLCJkZXZpY2UiOiJNYWMiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752642277","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752642277}"},"state":"LOGGED_IN"}	1752642277	\N	0
d84360d5-6596-4759-b1b3-f0f47a859688	6751cf92-6f1e-4f97-b0d9-254d6371ce20	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752642386	0	{"ipAddress":"211.230.160.64","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMTEuMjMwLjE2MC42NCIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752642386","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752642386}"},"state":"LOGGED_IN"}	1752642386	\N	0
109a1e37-beb8-4dc6-a400-dfb2b0b2088c	303f4c38-656a-4a09-b16a-5b9e20c9a92c	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752642738	0	{"ipAddress":"106.101.68.208","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMDYuMTAxLjY4LjIwOCIsIm9zIjoiTGludXgiLCJvc1ZlcnNpb24iOiJVbmtub3duIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752642738","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752642738}"},"state":"LOGGED_IN"}	1752642739	\N	1
32b0ef5a-9afe-4fb1-aaa1-43199b9ca591	e52334b8-c138-4a4d-85fa-e2a35d7968e6	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752642785	0	{"ipAddress":"118.235.83.99","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTguMjM1LjgzLjk5Iiwib3MiOiJpT1MiLCJvc1ZlcnNpb24iOiIxOC41IiwiYnJvd3NlciI6Ik1vYmlsZSBTYWZhcmkvMTguNSIsImRldmljZSI6ImlQaG9uZSIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6dHJ1ZX0=","AUTH_TIME":"1752642785","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752642785}"},"state":"LOGGED_IN"}	1752642786	\N	1
0b1a438f-0c77-4516-8c36-bf1a2b28f128	905d3736-39ff-4b84-a0bf-ab926a86b07c	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752643032	0	{"ipAddress":"116.46.60.80","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTYuNDYuNjAuODAiLCJvcyI6ImlPUyIsIm9zVmVyc2lvbiI6IjE4LjUiLCJicm93c2VyIjoiTW9iaWxlIFNhZmFyaS8xOC41IiwiZGV2aWNlIjoiaVBob25lIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjp0cnVlfQ==","AUTH_TIME":"1752643032","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752643032}"},"state":"LOGGED_IN"}	1752643032	\N	0
1ba21317-41ea-4711-b288-70182bc786d6	c0125d7c-f131-4eb0-b81b-bfb2c63a4b10	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752643091	0	{"ipAddress":"172.224.252.16","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNzIuMjI0LjI1Mi4xNiIsIm9zIjoiaU9TIiwib3NWZXJzaW9uIjoiMTguNSIsImJyb3dzZXIiOiJNb2JpbGUgU2FmYXJpLzE4LjUiLCJkZXZpY2UiOiJpUGhvbmUiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOnRydWV9","AUTH_TIME":"1752643091","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752643091,\\"28013791-89b3-4245-aae7-292a4b968494\\":1752643120}"},"state":"LOGGED_IN"}	1752643121	\N	3
14f73a32-b58e-4f1b-92e2-8fbfab160552	e9e94382-f6c7-4ee6-b3c0-676ff233b9f2	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752643703	0	{"ipAddress":"118.235.82.64","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTguMjM1LjgyLjY0Iiwib3MiOiJBbmRyb2lkIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiU2Ftc3VuZyBJbnRlcm5ldC8yOC4wIiwiZGV2aWNlIjoiSyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6dHJ1ZX0=","AUTH_TIME":"1752643703","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752643703}"},"state":"LOGGED_IN"}	1752643703	\N	0
cfe24d1c-a140-42f3-ad23-f343b9eb54d6	41c7cd25-e849-4d00-9c0d-e02b934a45d4	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752644011	0	{"ipAddress":"223.39.233.240","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMjMuMzkuMjMzLjI0MCIsIm9zIjoiQW5kcm9pZCIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZSBNb2JpbGUvMTM1LjAuMCIsImRldmljZSI6IksiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOnRydWV9","AUTH_TIME":"1752644011","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752644011,\\"28013791-89b3-4245-aae7-292a4b968494\\":1752644163}"},"state":"LOGGED_IN"}	1752644163	\N	2
d1426261-58fe-4d66-8997-6c5ed2114130	2bf7f5bd-82e6-4764-860f-247f774e5c59	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752644237	0	{"ipAddress":"163.180.171.76","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNjMuMTgwLjE3MS43NiIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752644237","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752644237}"},"state":"LOGGED_IN"}	1752644237	\N	0
3df84953-a5f6-431a-b4ae-580d27de2a8f	b3dcbb2f-bc34-486e-8767-0f87d08a57bb	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752644296	0	{"ipAddress":"39.117.60.226","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIzOS4xMTcuNjAuMjI2Iiwib3MiOiJNYWMgT1MgWCIsIm9zVmVyc2lvbiI6IjEwLjE1LjciLCJicm93c2VyIjoiQ2hyb21lLzEzNy4wLjAiLCJkZXZpY2UiOiJNYWMiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752644296","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752644296}"},"state":"LOGGED_IN"}	1752644296	\N	0
186f9618-1224-4f1c-a824-a30321e7e334	303f4c38-656a-4a09-b16a-5b9e20c9a92c	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752644597	0	{"ipAddress":"118.235.5.42","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTguMjM1LjUuNDIiLCJvcyI6ImlPUyIsIm9zVmVyc2lvbiI6IjE4LjUiLCJicm93c2VyIjoiTW9iaWxlIFNhZmFyaS8xOC41IiwiZGV2aWNlIjoiaVBob25lIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjp0cnVlfQ==","AUTH_TIME":"1752644597","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752644597}"},"state":"LOGGED_IN"}	1752644597	\N	0
ffd232e2-369c-42b0-8fe2-797a9f555923	dfcfd48a-afdd-47e9-9695-9aa0365f30c1	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752644681	0	{"ipAddress":"1.221.131.198","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxLjIyMS4xMzEuMTk4Iiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752644681","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752644681}"},"state":"LOGGED_IN"}	1752644681	\N	0
2f54f05a-3398-49bc-9f9b-93d9a0ffc0d5	13a74e6b-b98d-4e6b-97d1-01a103009dd9	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752645036	0	{"ipAddress":"221.139.243.216","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMjEuMTM5LjI0My4yMTYiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752645036","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752645036}"},"state":"LOGGED_IN"}	1752645036	\N	0
ef9df00e-d3a4-4a20-b0a6-81ff9dc19a9e	eb931243-5526-4798-9281-26f371b43659	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752645481	0	{"ipAddress":"165.132.179.38","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNjUuMTMyLjE3OS4zOCIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752645481","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752645481}"},"state":"LOGGED_IN"}	1752645481	\N	0
00a377f4-bd59-4a5c-88fe-6148c63a1705	45d4877c-8133-40f9-871a-a5a8601b63c9	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752645742	0	{"ipAddress":"119.194.32.228","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTkuMTk0LjMyLjIyOCIsIm9zIjoiQW5kcm9pZCIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZSBNb2JpbGUvMTM4LjAuMCIsImRldmljZSI6IksiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOnRydWV9","AUTH_TIME":"1752645742","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752645742}"},"state":"LOGGED_IN"}	1752645742	\N	0
15a2b39c-80e1-4a50-ac43-8e7276695f49	303f4c38-656a-4a09-b16a-5b9e20c9a92c	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752645827	0	{"ipAddress":"14.32.144.148","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNC4zMi4xNDQuMTQ4Iiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiRmlyZWZveC8xNDAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752645827","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752645827}"},"state":"LOGGED_IN"}	1752645827	\N	0
eeb5e03f-c204-482d-9857-21451921b20b	4782b99d-7aa5-4d06-8767-bfdf3d0f1c2a	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752643670	0	{"ipAddress":"125.180.26.252","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMjUuMTgwLjI2LjI1MiIsIm9zIjoiaU9TIiwib3NWZXJzaW9uIjoiMTguNSIsImJyb3dzZXIiOiJNb2JpbGUgU2FmYXJpLzE4LjUiLCJkZXZpY2UiOiJpUGhvbmUiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOnRydWV9","AUTH_TIME":"1752643670","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752643670}"},"state":"LOGGED_IN"}	1752651015	\N	1
39d7014a-98a1-4a9c-91dc-508d6b316691	a06bf14a-791c-4bf8-99af-47de4ea2e802	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752646198	0	{"ipAddress":"163.152.3.185","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNjMuMTUyLjMuMTg1Iiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiRWRnZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752646198","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752646198}"},"state":"LOGGED_IN"}	1752646199	\N	1
c16c4d63-5bab-486b-831b-87d4f92fa8fe	45d4877c-8133-40f9-871a-a5a8601b63c9	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752647237	0	{"ipAddress":"118.235.2.9","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTguMjM1LjIuOSIsIm9zIjoiQW5kcm9pZCIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZSBNb2JpbGUvMTM3LjAuMCIsImRldmljZSI6IksiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOnRydWV9","AUTH_TIME":"1752647237","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752647237}"},"state":"LOGGED_IN"}	1752647237	\N	0
966518da-1b94-4fdf-a560-eb24b8726ad4	3fc506f7-07d4-4e7d-87d9-6f8aae3941de	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752647584	0	{"ipAddress":"218.158.80.178","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMTguMTU4LjgwLjE3OCIsIm9zIjoiTWFjIE9TIFgiLCJvc1ZlcnNpb24iOiIxMC4xNS43IiwiYnJvd3NlciI6IlNhZmFyaS8xOC41IiwiZGV2aWNlIjoiTWFjIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752647584","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752647584}"},"state":"LOGGED_IN"}	1752647584	\N	0
34ded864-10d4-4288-84d0-edf58f29c033	0a8d87eb-6f1c-4418-ab79-681c6463f21c	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752648206	0	{"ipAddress":"1.237.106.67","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxLjIzNy4xMDYuNjciLCJvcyI6IldpbmRvd3MiLCJvc1ZlcnNpb24iOiIxMCIsImJyb3dzZXIiOiJDaHJvbWUvMTM4LjAuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=","AUTH_TIME":"1752648206","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752648206}"},"state":"LOGGED_IN"}	1752648206	\N	0
4b2c4931-de43-4c13-b248-97044cb556b4	b87843ff-6aab-4864-95a5-86d00784a693	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752648516	0	{"ipAddress":"221.140.25.141","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMjEuMTQwLjI1LjE0MSIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752648516","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752648516}"},"state":"LOGGED_IN"}	1752648516	\N	0
88636a77-3bb3-41d4-82e3-b50cf4275571	a1c2b840-08df-4398-be4e-e59514183896	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752649181	0	{"ipAddress":"220.68.54.112","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMjAuNjguNTQuMTEyIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752649181","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752649181}"},"state":"LOGGED_IN"}	1752649181	\N	0
36c45730-c600-423f-84d8-652e4a0507d7	0fa69601-b3fc-43ea-9976-c33995c633b3	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752650806	0	{"ipAddress":"211.234.206.139","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMTEuMjM0LjIwNi4xMzkiLCJvcyI6ImlPUyIsIm9zVmVyc2lvbiI6IjE4LjUuMCIsImJyb3dzZXIiOiJDaHJvbWUgTW9iaWxlIGlPUy8xMzguMC43MjA0IiwiZGV2aWNlIjoiaVBob25lIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjp0cnVlfQ==","AUTH_TIME":"1752650806","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752650806,\\"28013791-89b3-4245-aae7-292a4b968494\\":1752650810}"},"state":"LOGGED_IN"}	1752650810	\N	1
3b20dfc6-5f52-4680-aed9-2cf91a7f3fc5	0fa69601-b3fc-43ea-9976-c33995c633b3	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752650814	0	{"ipAddress":"112.145.85.243","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTIuMTQ1Ljg1LjI0MyIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752650814","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752650814}"},"state":"LOGGED_IN"}	1752650814	\N	0
ade59e9d-7b51-4645-8a55-49049479ef47	3ea0f5b1-93df-4dfa-9099-2ad50590d7ef	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752654320	0	{"ipAddress":"220.76.27.132","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIyMjAuNzYuMjcuMTMyIiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752654320"},"state":"LOGGED_IN"}	1752654320	\N	0
77d6852a-6548-4330-8d26-1ca2b0461929	43a93a2b-d34a-49a3-9f73-203329648b14	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752641527	0	{"ipAddress":"143.248.49.75","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNDMuMjQ4LjQ5Ljc1Iiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752641527","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752641527}"},"state":"LOGGED_IN"}	1752655211	\N	1
cdb42335-f1c9-4a76-8c59-82c663066632	0a8d87eb-6f1c-4418-ab79-681c6463f21c	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752655751	0	{"ipAddress":"1.229.36.51","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxLjIyOS4zNi41MSIsIm9zIjoiV2luZG93cyIsIm9zVmVyc2lvbiI6IjEwIiwiYnJvd3NlciI6IkNocm9tZS8xMzguMC4wIiwiZGV2aWNlIjoiT3RoZXIiLCJsYXN0QWNjZXNzIjowLCJtb2JpbGUiOmZhbHNlfQ==","AUTH_TIME":"1752655751","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752655751}"},"state":"LOGGED_IN"}	1752655751	\N	0
5913d9ca-0455-49a1-8ac9-3de8ad6f2a48	be1b8b0f-4467-4fb6-8aa0-f3bf31bc1d55	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752656197	0	{"ipAddress":"140.248.29.3","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxNDAuMjQ4LjI5LjMiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJTYWZhcmkvMTguNSIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752656197","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752656197}"},"state":"LOGGED_IN"}	1752656197	\N	0
fc5a7ff9-0dcc-46a4-82d4-3105c7b5e8b0	505a64a9-b535-44a7-8d72-9f0c9a7dd061	98deb0a8-a0bc-4d66-9005-e0960be33c64	1752647080	0	{"ipAddress":"117.16.164.29","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxMTcuMTYuMTY0LjI5Iiwib3MiOiJXaW5kb3dzIiwib3NWZXJzaW9uIjoiMTAiLCJicm93c2VyIjoiQ2hyb21lLzEzOC4wLjAiLCJkZXZpY2UiOiJPdGhlciIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1752647080","authenticators-completed":"{\\"bae2c45f-a5c0-4ed0-b187-e72dd1cf591f\\":1752647080}"},"state":"LOGGED_IN"}	1752656340	\N	2
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
37fa8420-3e9e-4f09-a745-f7316abf36c4	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
20a46fc4-5fa0-450e-878d-ba92923d4ca4	defaultResourceType	urn:Jupyter:resources:default
56e60bf8-e687-457c-81c4-0d20fd5ab0e9	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
fe025fc7-db60-4800-9e44-86cd9c082362	defaultResourceType	urn:KAIST-contest:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
93b7686f-76c1-4534-bb3c-e9736f60ef7d	audience resolve	openid-connect	oidc-audience-resolve-mapper	88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	\N
6ccc57d4-1400-4a28-97cb-65ea090abaca	locale	openid-connect	oidc-usermodel-attribute-mapper	73329852-97b5-4c69-b546-a331a596c306	\N
16b7cd9c-cb80-49fe-8cf5-2cc4b0c4a320	role list	saml	saml-role-list-mapper	\N	ba7c175a-ac34-4ad2-9114-04113c3ad176
822b2100-880c-4337-892f-97b42d0eaf97	organization	saml	saml-organization-membership-mapper	\N	265e8814-214f-4995-ba2b-963b0cbe3436
f234fa5a-0851-4e94-807d-d4658ec1d05d	full name	openid-connect	oidc-full-name-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
df437281-828a-4205-ad4b-dc656a586f8c	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
4c7d1b94-fa3c-40b5-b229-791217d53c9d	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
a5e264c7-39aa-4e3a-93fa-e3f65502b296	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
fda17486-2e29-4266-83b7-89c9a6e25847	username	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
1c94455f-d8ab-4226-97f7-b24cb9749a52	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
024cb54b-45a3-4cff-a7ff-c11992bfd36c	website	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
f0e476fd-656a-4b64-b229-07f1ed37838b	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
1d5d6511-18f7-450c-a0fc-dacc26f84415	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	b13501b1-cf3b-420d-8f1d-fbba2fd50221
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	email	openid-connect	oidc-usermodel-attribute-mapper	\N	def6a430-0aca-44b7-af7e-7957e815a8cb
a8793cf1-1eda-426f-b6bc-a305192da48f	email verified	openid-connect	oidc-usermodel-property-mapper	\N	def6a430-0aca-44b7-af7e-7957e815a8cb
eda70d74-8857-4a9c-8760-e545ca2cce86	address	openid-connect	oidc-address-mapper	\N	248380a2-9015-4dcf-9f18-807ada136213
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	eecdd1b9-366c-4a1f-996b-6c98df525ac3
44cef8fa-a917-4fd8-ae1f-5e12365acb87	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	eecdd1b9-366c-4a1f-996b-6c98df525ac3
d6348b47-bc8f-42a0-a2d1-669de1f99d7a	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	a3f88191-1ad2-43b7-bc62-fd2904e862f5
35031305-2a7c-438a-a930-8463fa0ce1b5	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	a3f88191-1ad2-43b7-bc62-fd2904e862f5
f5024dc1-8cbc-4955-96ea-83221645f461	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	a3f88191-1ad2-43b7-bc62-fd2904e862f5
c1a8687d-2fbb-4f19-8829-04f10d1ba553	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	bf28d1b3-0ef3-4091-9b60-85b0ef2782cd
e5d660e4-efc2-4322-a522-e257530a01cb	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	4e8cff58-e7df-4ab6-af1f-fc029dec2889
a3210159-a04e-403c-b82a-7f54de95485c	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	4e8cff58-e7df-4ab6-af1f-fc029dec2889
0ffc126c-4356-49b3-bf98-afcad357d1d0	acr loa level	openid-connect	oidc-acr-mapper	\N	e1836b1b-decc-4c4b-889d-d08cd825c5ee
1aa61dff-d364-4ef3-aa3a-091617a4f535	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a
092464c9-b8d8-434c-a721-16191bfc3c24	sub	openid-connect	oidc-sub-mapper	\N	4ebff3a1-bb67-4201-b7fb-2ffc79c47f0a
22b01bbb-b5e4-4d95-98c0-8f7bd23553a9	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	be7c56b8-4fe2-4681-a3b7-e37d1b0b0317
abdad2e0-f5e3-4cde-b366-6ab1cd006b46	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	be7c56b8-4fe2-4681-a3b7-e37d1b0b0317
ce9daa6d-5416-42c9-a7f4-c049d61bf37a	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	be7c56b8-4fe2-4681-a3b7-e37d1b0b0317
573ee61d-52b1-4cc7-aae2-2e6bc02d306b	organization	openid-connect	oidc-organization-membership-mapper	\N	ada5f296-7a5a-4f80-b839-25e1063155ea
deb60815-0008-4bb1-8c83-8fdb95c79ddd	audience resolve	openid-connect	oidc-audience-resolve-mapper	3c69f671-c1f7-4a18-9fe3-b3401476c57e	\N
adc5e948-3078-4336-ba51-f053b6a9c9d4	role list	saml	saml-role-list-mapper	\N	dfe1f3fe-2a77-47e9-b551-8bb3c833579e
5cb48181-0ff6-44fc-9222-4bef70b63da5	organization	saml	saml-organization-membership-mapper	\N	40b4bb43-e046-4f79-8cf7-d4de210cd844
27a8fbbb-3a89-4403-b3e2-af51f9cf33f1	full name	openid-connect	oidc-full-name-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
cdd145b5-3490-46e6-a86e-f275197990db	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
f244e2d4-722a-4821-9849-168a7a4f820d	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
bca5a85f-6435-45ce-a390-a52b4b123ae8	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
67a8a98a-ac31-4dbd-9e31-abc80275454d	username	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
4a3db798-ded4-45ca-8787-9bc332c48df5	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	website	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
8f65d47e-27e5-47bb-aa70-c182e161e2fa	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	b05d4e55-4ef5-4982-9d19-7ffcb6e1a1a4
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	email	openid-connect	oidc-usermodel-attribute-mapper	\N	17ca2a77-61c1-4e6b-b33c-dcef39419bd8
dd9fb545-9a63-436a-8342-3cdc327c36e8	email verified	openid-connect	oidc-usermodel-property-mapper	\N	17ca2a77-61c1-4e6b-b33c-dcef39419bd8
55a8c5a3-076a-439f-af63-1b38d83488d2	address	openid-connect	oidc-address-mapper	\N	c2ebd575-9497-4987-b5cc-62328a68b40f
d859d1b7-72ae-486f-b3ef-2783277028b2	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	ef5e62ae-487b-4e42-8788-878b8ab60bd8
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	ef5e62ae-487b-4e42-8788-878b8ab60bd8
b2649935-861e-4667-bbd3-2c087e5532be	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	4a89fcaf-6f02-486b-a6ef-933e7d2bd034
45bd71c6-ffc1-4f86-bbf6-edc1d1180f91	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	4a89fcaf-6f02-486b-a6ef-933e7d2bd034
f09e634b-88b9-4e7b-a1d2-14abc4f366db	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	4a89fcaf-6f02-486b-a6ef-933e7d2bd034
2fbea2e1-2f6e-48c0-90a4-ca58dfd7b6b9	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	e8ea0deb-52f6-4266-baf7-ecbc1a9f05b7
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	5040846b-e2aa-4623-bf8c-ad9f74c3dd78
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	5040846b-e2aa-4623-bf8c-ad9f74c3dd78
cc2350b7-8382-4148-bfb3-e46273b773c2	acr loa level	openid-connect	oidc-acr-mapper	\N	539a55bc-a41f-4f99-aa61-238efd8dafaa
39e31f28-447f-4871-b1a0-e5f582f2b2eb	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	2e23b5a1-79df-47ef-a87f-31026eb67719
916579f0-aa7b-40c2-8b7a-383880163d9c	sub	openid-connect	oidc-sub-mapper	\N	2e23b5a1-79df-47ef-a87f-31026eb67719
ebc20649-c05a-41a2-ab6a-c5980d2ae65d	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	635ea8bc-6de5-47f2-9967-897903156c80
2ccef3b9-f9a8-405e-81a5-817545f8ef55	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	635ea8bc-6de5-47f2-9967-897903156c80
47137169-e87e-421b-a191-bd4f3e84fb1f	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	635ea8bc-6de5-47f2-9967-897903156c80
e87d80e2-8c34-4df1-8bda-70ac1f9db5cb	organization	openid-connect	oidc-organization-membership-mapper	\N	07632233-3098-443a-a651-07706c649104
1b145a9d-3d3e-4f42-b267-f21594b8808b	locale	openid-connect	oidc-usermodel-attribute-mapper	fec5f95f-dd42-44f1-a854-96e37b0f7653	\N
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	a3ac19af-575c-4dd0-9d3d-7d40b960c599
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
6ccc57d4-1400-4a28-97cb-65ea090abaca	true	introspection.token.claim
6ccc57d4-1400-4a28-97cb-65ea090abaca	true	userinfo.token.claim
6ccc57d4-1400-4a28-97cb-65ea090abaca	locale	user.attribute
6ccc57d4-1400-4a28-97cb-65ea090abaca	true	id.token.claim
6ccc57d4-1400-4a28-97cb-65ea090abaca	true	access.token.claim
6ccc57d4-1400-4a28-97cb-65ea090abaca	locale	claim.name
6ccc57d4-1400-4a28-97cb-65ea090abaca	String	jsonType.label
16b7cd9c-cb80-49fe-8cf5-2cc4b0c4a320	false	single
16b7cd9c-cb80-49fe-8cf5-2cc4b0c4a320	Basic	attribute.nameformat
16b7cd9c-cb80-49fe-8cf5-2cc4b0c4a320	Role	attribute.name
024cb54b-45a3-4cff-a7ff-c11992bfd36c	true	introspection.token.claim
024cb54b-45a3-4cff-a7ff-c11992bfd36c	true	userinfo.token.claim
024cb54b-45a3-4cff-a7ff-c11992bfd36c	website	user.attribute
024cb54b-45a3-4cff-a7ff-c11992bfd36c	true	id.token.claim
024cb54b-45a3-4cff-a7ff-c11992bfd36c	true	access.token.claim
024cb54b-45a3-4cff-a7ff-c11992bfd36c	website	claim.name
024cb54b-45a3-4cff-a7ff-c11992bfd36c	String	jsonType.label
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	true	introspection.token.claim
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	true	userinfo.token.claim
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	locale	user.attribute
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	true	id.token.claim
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	true	access.token.claim
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	locale	claim.name
0c4b4bb7-bd48-4b6e-9a98-76f041d3106f	String	jsonType.label
1c94455f-d8ab-4226-97f7-b24cb9749a52	true	introspection.token.claim
1c94455f-d8ab-4226-97f7-b24cb9749a52	true	userinfo.token.claim
1c94455f-d8ab-4226-97f7-b24cb9749a52	picture	user.attribute
1c94455f-d8ab-4226-97f7-b24cb9749a52	true	id.token.claim
1c94455f-d8ab-4226-97f7-b24cb9749a52	true	access.token.claim
1c94455f-d8ab-4226-97f7-b24cb9749a52	picture	claim.name
1c94455f-d8ab-4226-97f7-b24cb9749a52	String	jsonType.label
1d5d6511-18f7-450c-a0fc-dacc26f84415	true	introspection.token.claim
1d5d6511-18f7-450c-a0fc-dacc26f84415	true	userinfo.token.claim
1d5d6511-18f7-450c-a0fc-dacc26f84415	updatedAt	user.attribute
1d5d6511-18f7-450c-a0fc-dacc26f84415	true	id.token.claim
1d5d6511-18f7-450c-a0fc-dacc26f84415	true	access.token.claim
1d5d6511-18f7-450c-a0fc-dacc26f84415	updated_at	claim.name
1d5d6511-18f7-450c-a0fc-dacc26f84415	long	jsonType.label
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	true	introspection.token.claim
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	true	userinfo.token.claim
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	birthdate	user.attribute
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	true	id.token.claim
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	true	access.token.claim
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	birthdate	claim.name
30bceff3-b7bf-47c3-8dad-86cd4bd6f9c3	String	jsonType.label
4c7d1b94-fa3c-40b5-b229-791217d53c9d	true	introspection.token.claim
4c7d1b94-fa3c-40b5-b229-791217d53c9d	true	userinfo.token.claim
4c7d1b94-fa3c-40b5-b229-791217d53c9d	firstName	user.attribute
4c7d1b94-fa3c-40b5-b229-791217d53c9d	true	id.token.claim
4c7d1b94-fa3c-40b5-b229-791217d53c9d	true	access.token.claim
4c7d1b94-fa3c-40b5-b229-791217d53c9d	given_name	claim.name
4c7d1b94-fa3c-40b5-b229-791217d53c9d	String	jsonType.label
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	true	introspection.token.claim
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	true	userinfo.token.claim
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	nickname	user.attribute
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	true	id.token.claim
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	true	access.token.claim
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	nickname	claim.name
7f9d2bcc-7876-47f4-b3ea-b32f0417bcfa	String	jsonType.label
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	true	introspection.token.claim
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	true	userinfo.token.claim
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	profile	user.attribute
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	true	id.token.claim
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	true	access.token.claim
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	profile	claim.name
9a64c9a2-a99b-4a3a-a3da-9f3cad7ec008	String	jsonType.label
a5e264c7-39aa-4e3a-93fa-e3f65502b296	true	introspection.token.claim
a5e264c7-39aa-4e3a-93fa-e3f65502b296	true	userinfo.token.claim
a5e264c7-39aa-4e3a-93fa-e3f65502b296	middleName	user.attribute
a5e264c7-39aa-4e3a-93fa-e3f65502b296	true	id.token.claim
a5e264c7-39aa-4e3a-93fa-e3f65502b296	true	access.token.claim
a5e264c7-39aa-4e3a-93fa-e3f65502b296	middle_name	claim.name
a5e264c7-39aa-4e3a-93fa-e3f65502b296	String	jsonType.label
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	true	introspection.token.claim
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	true	userinfo.token.claim
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	zoneinfo	user.attribute
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	true	id.token.claim
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	true	access.token.claim
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	zoneinfo	claim.name
b49e4cd4-0bad-48b9-8707-b8b0bb5bf75c	String	jsonType.label
df437281-828a-4205-ad4b-dc656a586f8c	true	introspection.token.claim
df437281-828a-4205-ad4b-dc656a586f8c	true	userinfo.token.claim
df437281-828a-4205-ad4b-dc656a586f8c	lastName	user.attribute
df437281-828a-4205-ad4b-dc656a586f8c	true	id.token.claim
df437281-828a-4205-ad4b-dc656a586f8c	true	access.token.claim
df437281-828a-4205-ad4b-dc656a586f8c	family_name	claim.name
df437281-828a-4205-ad4b-dc656a586f8c	String	jsonType.label
f0e476fd-656a-4b64-b229-07f1ed37838b	true	introspection.token.claim
f0e476fd-656a-4b64-b229-07f1ed37838b	true	userinfo.token.claim
f0e476fd-656a-4b64-b229-07f1ed37838b	gender	user.attribute
f0e476fd-656a-4b64-b229-07f1ed37838b	true	id.token.claim
f0e476fd-656a-4b64-b229-07f1ed37838b	true	access.token.claim
f0e476fd-656a-4b64-b229-07f1ed37838b	gender	claim.name
f0e476fd-656a-4b64-b229-07f1ed37838b	String	jsonType.label
f234fa5a-0851-4e94-807d-d4658ec1d05d	true	introspection.token.claim
f234fa5a-0851-4e94-807d-d4658ec1d05d	true	userinfo.token.claim
f234fa5a-0851-4e94-807d-d4658ec1d05d	true	id.token.claim
f234fa5a-0851-4e94-807d-d4658ec1d05d	true	access.token.claim
fda17486-2e29-4266-83b7-89c9a6e25847	true	introspection.token.claim
fda17486-2e29-4266-83b7-89c9a6e25847	true	userinfo.token.claim
fda17486-2e29-4266-83b7-89c9a6e25847	username	user.attribute
fda17486-2e29-4266-83b7-89c9a6e25847	true	id.token.claim
fda17486-2e29-4266-83b7-89c9a6e25847	true	access.token.claim
fda17486-2e29-4266-83b7-89c9a6e25847	preferred_username	claim.name
fda17486-2e29-4266-83b7-89c9a6e25847	String	jsonType.label
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	true	introspection.token.claim
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	true	userinfo.token.claim
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	email	user.attribute
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	true	id.token.claim
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	true	access.token.claim
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	email	claim.name
6c0b0937-8bd5-460e-b4e8-b2eb13ebc458	String	jsonType.label
a8793cf1-1eda-426f-b6bc-a305192da48f	true	introspection.token.claim
a8793cf1-1eda-426f-b6bc-a305192da48f	true	userinfo.token.claim
a8793cf1-1eda-426f-b6bc-a305192da48f	emailVerified	user.attribute
a8793cf1-1eda-426f-b6bc-a305192da48f	true	id.token.claim
a8793cf1-1eda-426f-b6bc-a305192da48f	true	access.token.claim
a8793cf1-1eda-426f-b6bc-a305192da48f	email_verified	claim.name
a8793cf1-1eda-426f-b6bc-a305192da48f	boolean	jsonType.label
eda70d74-8857-4a9c-8760-e545ca2cce86	formatted	user.attribute.formatted
eda70d74-8857-4a9c-8760-e545ca2cce86	country	user.attribute.country
eda70d74-8857-4a9c-8760-e545ca2cce86	true	introspection.token.claim
eda70d74-8857-4a9c-8760-e545ca2cce86	postal_code	user.attribute.postal_code
eda70d74-8857-4a9c-8760-e545ca2cce86	true	userinfo.token.claim
eda70d74-8857-4a9c-8760-e545ca2cce86	street	user.attribute.street
eda70d74-8857-4a9c-8760-e545ca2cce86	true	id.token.claim
eda70d74-8857-4a9c-8760-e545ca2cce86	region	user.attribute.region
eda70d74-8857-4a9c-8760-e545ca2cce86	true	access.token.claim
eda70d74-8857-4a9c-8760-e545ca2cce86	locality	user.attribute.locality
44cef8fa-a917-4fd8-ae1f-5e12365acb87	true	introspection.token.claim
44cef8fa-a917-4fd8-ae1f-5e12365acb87	true	userinfo.token.claim
44cef8fa-a917-4fd8-ae1f-5e12365acb87	phoneNumberVerified	user.attribute
44cef8fa-a917-4fd8-ae1f-5e12365acb87	true	id.token.claim
44cef8fa-a917-4fd8-ae1f-5e12365acb87	true	access.token.claim
44cef8fa-a917-4fd8-ae1f-5e12365acb87	phone_number_verified	claim.name
44cef8fa-a917-4fd8-ae1f-5e12365acb87	boolean	jsonType.label
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	true	introspection.token.claim
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	true	userinfo.token.claim
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	phoneNumber	user.attribute
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	true	id.token.claim
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	true	access.token.claim
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	phone_number	claim.name
803a8c5e-bbd1-40d0-8e16-04afc6d7b48c	String	jsonType.label
35031305-2a7c-438a-a930-8463fa0ce1b5	true	introspection.token.claim
35031305-2a7c-438a-a930-8463fa0ce1b5	true	multivalued
35031305-2a7c-438a-a930-8463fa0ce1b5	foo	user.attribute
35031305-2a7c-438a-a930-8463fa0ce1b5	true	access.token.claim
35031305-2a7c-438a-a930-8463fa0ce1b5	resource_access.${client_id}.roles	claim.name
35031305-2a7c-438a-a930-8463fa0ce1b5	String	jsonType.label
d6348b47-bc8f-42a0-a2d1-669de1f99d7a	true	introspection.token.claim
d6348b47-bc8f-42a0-a2d1-669de1f99d7a	true	multivalued
d6348b47-bc8f-42a0-a2d1-669de1f99d7a	foo	user.attribute
d6348b47-bc8f-42a0-a2d1-669de1f99d7a	true	access.token.claim
d6348b47-bc8f-42a0-a2d1-669de1f99d7a	realm_access.roles	claim.name
d6348b47-bc8f-42a0-a2d1-669de1f99d7a	String	jsonType.label
f5024dc1-8cbc-4955-96ea-83221645f461	true	introspection.token.claim
f5024dc1-8cbc-4955-96ea-83221645f461	true	access.token.claim
c1a8687d-2fbb-4f19-8829-04f10d1ba553	true	introspection.token.claim
c1a8687d-2fbb-4f19-8829-04f10d1ba553	true	access.token.claim
a3210159-a04e-403c-b82a-7f54de95485c	true	introspection.token.claim
a3210159-a04e-403c-b82a-7f54de95485c	true	multivalued
a3210159-a04e-403c-b82a-7f54de95485c	foo	user.attribute
a3210159-a04e-403c-b82a-7f54de95485c	true	id.token.claim
a3210159-a04e-403c-b82a-7f54de95485c	true	access.token.claim
a3210159-a04e-403c-b82a-7f54de95485c	groups	claim.name
a3210159-a04e-403c-b82a-7f54de95485c	String	jsonType.label
e5d660e4-efc2-4322-a522-e257530a01cb	true	introspection.token.claim
e5d660e4-efc2-4322-a522-e257530a01cb	true	userinfo.token.claim
e5d660e4-efc2-4322-a522-e257530a01cb	username	user.attribute
e5d660e4-efc2-4322-a522-e257530a01cb	true	id.token.claim
e5d660e4-efc2-4322-a522-e257530a01cb	true	access.token.claim
e5d660e4-efc2-4322-a522-e257530a01cb	upn	claim.name
e5d660e4-efc2-4322-a522-e257530a01cb	String	jsonType.label
0ffc126c-4356-49b3-bf98-afcad357d1d0	true	introspection.token.claim
0ffc126c-4356-49b3-bf98-afcad357d1d0	true	id.token.claim
0ffc126c-4356-49b3-bf98-afcad357d1d0	true	access.token.claim
092464c9-b8d8-434c-a721-16191bfc3c24	true	introspection.token.claim
092464c9-b8d8-434c-a721-16191bfc3c24	true	access.token.claim
1aa61dff-d364-4ef3-aa3a-091617a4f535	AUTH_TIME	user.session.note
1aa61dff-d364-4ef3-aa3a-091617a4f535	true	introspection.token.claim
1aa61dff-d364-4ef3-aa3a-091617a4f535	true	id.token.claim
1aa61dff-d364-4ef3-aa3a-091617a4f535	true	access.token.claim
1aa61dff-d364-4ef3-aa3a-091617a4f535	auth_time	claim.name
1aa61dff-d364-4ef3-aa3a-091617a4f535	long	jsonType.label
22b01bbb-b5e4-4d95-98c0-8f7bd23553a9	client_id	user.session.note
22b01bbb-b5e4-4d95-98c0-8f7bd23553a9	true	introspection.token.claim
22b01bbb-b5e4-4d95-98c0-8f7bd23553a9	true	id.token.claim
22b01bbb-b5e4-4d95-98c0-8f7bd23553a9	true	access.token.claim
22b01bbb-b5e4-4d95-98c0-8f7bd23553a9	client_id	claim.name
22b01bbb-b5e4-4d95-98c0-8f7bd23553a9	String	jsonType.label
abdad2e0-f5e3-4cde-b366-6ab1cd006b46	clientHost	user.session.note
abdad2e0-f5e3-4cde-b366-6ab1cd006b46	true	introspection.token.claim
abdad2e0-f5e3-4cde-b366-6ab1cd006b46	true	id.token.claim
abdad2e0-f5e3-4cde-b366-6ab1cd006b46	true	access.token.claim
abdad2e0-f5e3-4cde-b366-6ab1cd006b46	clientHost	claim.name
abdad2e0-f5e3-4cde-b366-6ab1cd006b46	String	jsonType.label
ce9daa6d-5416-42c9-a7f4-c049d61bf37a	clientAddress	user.session.note
ce9daa6d-5416-42c9-a7f4-c049d61bf37a	true	introspection.token.claim
ce9daa6d-5416-42c9-a7f4-c049d61bf37a	true	id.token.claim
ce9daa6d-5416-42c9-a7f4-c049d61bf37a	true	access.token.claim
ce9daa6d-5416-42c9-a7f4-c049d61bf37a	clientAddress	claim.name
ce9daa6d-5416-42c9-a7f4-c049d61bf37a	String	jsonType.label
573ee61d-52b1-4cc7-aae2-2e6bc02d306b	true	introspection.token.claim
573ee61d-52b1-4cc7-aae2-2e6bc02d306b	true	multivalued
573ee61d-52b1-4cc7-aae2-2e6bc02d306b	true	id.token.claim
573ee61d-52b1-4cc7-aae2-2e6bc02d306b	true	access.token.claim
573ee61d-52b1-4cc7-aae2-2e6bc02d306b	organization	claim.name
573ee61d-52b1-4cc7-aae2-2e6bc02d306b	String	jsonType.label
adc5e948-3078-4336-ba51-f053b6a9c9d4	false	single
adc5e948-3078-4336-ba51-f053b6a9c9d4	Basic	attribute.nameformat
adc5e948-3078-4336-ba51-f053b6a9c9d4	Role	attribute.name
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	true	introspection.token.claim
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	true	userinfo.token.claim
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	updatedAt	user.attribute
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	true	id.token.claim
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	true	access.token.claim
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	updated_at	claim.name
2126f344-ec95-48e1-8d80-0c84f5bf2fd9	long	jsonType.label
27a8fbbb-3a89-4403-b3e2-af51f9cf33f1	true	introspection.token.claim
27a8fbbb-3a89-4403-b3e2-af51f9cf33f1	true	userinfo.token.claim
27a8fbbb-3a89-4403-b3e2-af51f9cf33f1	true	id.token.claim
27a8fbbb-3a89-4403-b3e2-af51f9cf33f1	true	access.token.claim
4a3db798-ded4-45ca-8787-9bc332c48df5	true	introspection.token.claim
4a3db798-ded4-45ca-8787-9bc332c48df5	true	userinfo.token.claim
4a3db798-ded4-45ca-8787-9bc332c48df5	picture	user.attribute
4a3db798-ded4-45ca-8787-9bc332c48df5	true	id.token.claim
4a3db798-ded4-45ca-8787-9bc332c48df5	true	access.token.claim
4a3db798-ded4-45ca-8787-9bc332c48df5	picture	claim.name
4a3db798-ded4-45ca-8787-9bc332c48df5	String	jsonType.label
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	true	introspection.token.claim
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	true	userinfo.token.claim
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	website	user.attribute
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	true	id.token.claim
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	true	access.token.claim
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	website	claim.name
5df3a8d7-5dd8-4609-a2b5-6bf44afb0de4	String	jsonType.label
67a8a98a-ac31-4dbd-9e31-abc80275454d	true	introspection.token.claim
67a8a98a-ac31-4dbd-9e31-abc80275454d	true	userinfo.token.claim
67a8a98a-ac31-4dbd-9e31-abc80275454d	username	user.attribute
67a8a98a-ac31-4dbd-9e31-abc80275454d	true	id.token.claim
67a8a98a-ac31-4dbd-9e31-abc80275454d	true	access.token.claim
67a8a98a-ac31-4dbd-9e31-abc80275454d	preferred_username	claim.name
67a8a98a-ac31-4dbd-9e31-abc80275454d	String	jsonType.label
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	true	introspection.token.claim
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	true	userinfo.token.claim
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	profile	user.attribute
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	true	id.token.claim
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	true	access.token.claim
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	profile	claim.name
7ae8f7c9-e92a-4240-b146-2945a07d9fd1	String	jsonType.label
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	true	introspection.token.claim
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	true	userinfo.token.claim
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	middleName	user.attribute
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	true	id.token.claim
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	true	access.token.claim
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	middle_name	claim.name
7e3ac458-dfdd-4bb2-98af-a540bff2ad64	String	jsonType.label
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	true	introspection.token.claim
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	true	userinfo.token.claim
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	gender	user.attribute
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	true	id.token.claim
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	true	access.token.claim
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	gender	claim.name
7ea8f624-faca-4013-92e6-0ff7eb0a0dbb	String	jsonType.label
8f65d47e-27e5-47bb-aa70-c182e161e2fa	true	introspection.token.claim
8f65d47e-27e5-47bb-aa70-c182e161e2fa	true	userinfo.token.claim
8f65d47e-27e5-47bb-aa70-c182e161e2fa	zoneinfo	user.attribute
8f65d47e-27e5-47bb-aa70-c182e161e2fa	true	id.token.claim
8f65d47e-27e5-47bb-aa70-c182e161e2fa	true	access.token.claim
8f65d47e-27e5-47bb-aa70-c182e161e2fa	zoneinfo	claim.name
8f65d47e-27e5-47bb-aa70-c182e161e2fa	String	jsonType.label
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	true	introspection.token.claim
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	true	userinfo.token.claim
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	birthdate	user.attribute
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	true	id.token.claim
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	true	access.token.claim
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	birthdate	claim.name
ae395ddb-7be2-4881-8653-a3e3f7eaa94c	String	jsonType.label
bca5a85f-6435-45ce-a390-a52b4b123ae8	true	introspection.token.claim
bca5a85f-6435-45ce-a390-a52b4b123ae8	true	userinfo.token.claim
bca5a85f-6435-45ce-a390-a52b4b123ae8	nickname	user.attribute
bca5a85f-6435-45ce-a390-a52b4b123ae8	true	id.token.claim
bca5a85f-6435-45ce-a390-a52b4b123ae8	true	access.token.claim
bca5a85f-6435-45ce-a390-a52b4b123ae8	nickname	claim.name
bca5a85f-6435-45ce-a390-a52b4b123ae8	String	jsonType.label
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	true	introspection.token.claim
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	true	userinfo.token.claim
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	locale	user.attribute
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	true	id.token.claim
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	true	access.token.claim
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	locale	claim.name
bfb6fac4-e043-40bf-b7c6-e1ebc4adac4f	String	jsonType.label
cdd145b5-3490-46e6-a86e-f275197990db	true	introspection.token.claim
cdd145b5-3490-46e6-a86e-f275197990db	true	userinfo.token.claim
cdd145b5-3490-46e6-a86e-f275197990db	lastName	user.attribute
cdd145b5-3490-46e6-a86e-f275197990db	true	id.token.claim
cdd145b5-3490-46e6-a86e-f275197990db	true	access.token.claim
cdd145b5-3490-46e6-a86e-f275197990db	family_name	claim.name
cdd145b5-3490-46e6-a86e-f275197990db	String	jsonType.label
f244e2d4-722a-4821-9849-168a7a4f820d	true	introspection.token.claim
f244e2d4-722a-4821-9849-168a7a4f820d	true	userinfo.token.claim
f244e2d4-722a-4821-9849-168a7a4f820d	firstName	user.attribute
f244e2d4-722a-4821-9849-168a7a4f820d	true	id.token.claim
f244e2d4-722a-4821-9849-168a7a4f820d	true	access.token.claim
f244e2d4-722a-4821-9849-168a7a4f820d	given_name	claim.name
f244e2d4-722a-4821-9849-168a7a4f820d	String	jsonType.label
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	true	introspection.token.claim
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	true	userinfo.token.claim
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	email	user.attribute
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	true	id.token.claim
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	true	access.token.claim
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	email	claim.name
8be2ce1b-c1f9-478c-8c68-8bbbef077b61	String	jsonType.label
dd9fb545-9a63-436a-8342-3cdc327c36e8	true	introspection.token.claim
dd9fb545-9a63-436a-8342-3cdc327c36e8	true	userinfo.token.claim
dd9fb545-9a63-436a-8342-3cdc327c36e8	emailVerified	user.attribute
dd9fb545-9a63-436a-8342-3cdc327c36e8	true	id.token.claim
dd9fb545-9a63-436a-8342-3cdc327c36e8	true	access.token.claim
dd9fb545-9a63-436a-8342-3cdc327c36e8	email_verified	claim.name
dd9fb545-9a63-436a-8342-3cdc327c36e8	boolean	jsonType.label
55a8c5a3-076a-439f-af63-1b38d83488d2	formatted	user.attribute.formatted
55a8c5a3-076a-439f-af63-1b38d83488d2	country	user.attribute.country
55a8c5a3-076a-439f-af63-1b38d83488d2	true	introspection.token.claim
55a8c5a3-076a-439f-af63-1b38d83488d2	postal_code	user.attribute.postal_code
55a8c5a3-076a-439f-af63-1b38d83488d2	true	userinfo.token.claim
55a8c5a3-076a-439f-af63-1b38d83488d2	street	user.attribute.street
55a8c5a3-076a-439f-af63-1b38d83488d2	true	id.token.claim
55a8c5a3-076a-439f-af63-1b38d83488d2	region	user.attribute.region
55a8c5a3-076a-439f-af63-1b38d83488d2	true	access.token.claim
55a8c5a3-076a-439f-af63-1b38d83488d2	locality	user.attribute.locality
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	true	introspection.token.claim
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	true	userinfo.token.claim
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	phoneNumberVerified	user.attribute
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	true	id.token.claim
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	true	access.token.claim
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	phone_number_verified	claim.name
2b2e457e-1fe2-462a-ae8f-70e14ddaba6c	boolean	jsonType.label
d859d1b7-72ae-486f-b3ef-2783277028b2	true	introspection.token.claim
d859d1b7-72ae-486f-b3ef-2783277028b2	true	userinfo.token.claim
d859d1b7-72ae-486f-b3ef-2783277028b2	phoneNumber	user.attribute
d859d1b7-72ae-486f-b3ef-2783277028b2	true	id.token.claim
d859d1b7-72ae-486f-b3ef-2783277028b2	true	access.token.claim
d859d1b7-72ae-486f-b3ef-2783277028b2	phone_number	claim.name
d859d1b7-72ae-486f-b3ef-2783277028b2	String	jsonType.label
45bd71c6-ffc1-4f86-bbf6-edc1d1180f91	true	introspection.token.claim
45bd71c6-ffc1-4f86-bbf6-edc1d1180f91	true	multivalued
45bd71c6-ffc1-4f86-bbf6-edc1d1180f91	foo	user.attribute
45bd71c6-ffc1-4f86-bbf6-edc1d1180f91	true	access.token.claim
45bd71c6-ffc1-4f86-bbf6-edc1d1180f91	resource_access.${client_id}.roles	claim.name
45bd71c6-ffc1-4f86-bbf6-edc1d1180f91	String	jsonType.label
b2649935-861e-4667-bbd3-2c087e5532be	true	introspection.token.claim
b2649935-861e-4667-bbd3-2c087e5532be	true	multivalued
b2649935-861e-4667-bbd3-2c087e5532be	foo	user.attribute
b2649935-861e-4667-bbd3-2c087e5532be	true	access.token.claim
b2649935-861e-4667-bbd3-2c087e5532be	realm_access.roles	claim.name
b2649935-861e-4667-bbd3-2c087e5532be	String	jsonType.label
f09e634b-88b9-4e7b-a1d2-14abc4f366db	true	introspection.token.claim
f09e634b-88b9-4e7b-a1d2-14abc4f366db	true	access.token.claim
2fbea2e1-2f6e-48c0-90a4-ca58dfd7b6b9	true	introspection.token.claim
2fbea2e1-2f6e-48c0-90a4-ca58dfd7b6b9	true	access.token.claim
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	true	introspection.token.claim
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	true	userinfo.token.claim
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	username	user.attribute
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	true	id.token.claim
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	true	access.token.claim
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	upn	claim.name
be3fa3a2-31c4-46eb-a849-bc4b28427b0d	String	jsonType.label
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	true	introspection.token.claim
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	true	multivalued
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	foo	user.attribute
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	true	id.token.claim
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	true	access.token.claim
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	groups	claim.name
c4f02aef-07ae-4cda-ab86-406b2cd2b5b1	String	jsonType.label
cc2350b7-8382-4148-bfb3-e46273b773c2	true	introspection.token.claim
cc2350b7-8382-4148-bfb3-e46273b773c2	true	id.token.claim
cc2350b7-8382-4148-bfb3-e46273b773c2	true	access.token.claim
39e31f28-447f-4871-b1a0-e5f582f2b2eb	AUTH_TIME	user.session.note
39e31f28-447f-4871-b1a0-e5f582f2b2eb	true	introspection.token.claim
39e31f28-447f-4871-b1a0-e5f582f2b2eb	true	id.token.claim
39e31f28-447f-4871-b1a0-e5f582f2b2eb	true	access.token.claim
39e31f28-447f-4871-b1a0-e5f582f2b2eb	auth_time	claim.name
39e31f28-447f-4871-b1a0-e5f582f2b2eb	long	jsonType.label
916579f0-aa7b-40c2-8b7a-383880163d9c	true	introspection.token.claim
916579f0-aa7b-40c2-8b7a-383880163d9c	true	access.token.claim
2ccef3b9-f9a8-405e-81a5-817545f8ef55	clientHost	user.session.note
2ccef3b9-f9a8-405e-81a5-817545f8ef55	true	introspection.token.claim
2ccef3b9-f9a8-405e-81a5-817545f8ef55	true	id.token.claim
2ccef3b9-f9a8-405e-81a5-817545f8ef55	true	access.token.claim
2ccef3b9-f9a8-405e-81a5-817545f8ef55	clientHost	claim.name
2ccef3b9-f9a8-405e-81a5-817545f8ef55	String	jsonType.label
47137169-e87e-421b-a191-bd4f3e84fb1f	clientAddress	user.session.note
47137169-e87e-421b-a191-bd4f3e84fb1f	true	introspection.token.claim
47137169-e87e-421b-a191-bd4f3e84fb1f	true	id.token.claim
47137169-e87e-421b-a191-bd4f3e84fb1f	true	access.token.claim
47137169-e87e-421b-a191-bd4f3e84fb1f	clientAddress	claim.name
47137169-e87e-421b-a191-bd4f3e84fb1f	String	jsonType.label
ebc20649-c05a-41a2-ab6a-c5980d2ae65d	client_id	user.session.note
ebc20649-c05a-41a2-ab6a-c5980d2ae65d	true	introspection.token.claim
ebc20649-c05a-41a2-ab6a-c5980d2ae65d	true	id.token.claim
ebc20649-c05a-41a2-ab6a-c5980d2ae65d	true	access.token.claim
ebc20649-c05a-41a2-ab6a-c5980d2ae65d	client_id	claim.name
ebc20649-c05a-41a2-ab6a-c5980d2ae65d	String	jsonType.label
e87d80e2-8c34-4df1-8bda-70ac1f9db5cb	true	introspection.token.claim
e87d80e2-8c34-4df1-8bda-70ac1f9db5cb	true	multivalued
e87d80e2-8c34-4df1-8bda-70ac1f9db5cb	true	id.token.claim
e87d80e2-8c34-4df1-8bda-70ac1f9db5cb	true	access.token.claim
e87d80e2-8c34-4df1-8bda-70ac1f9db5cb	organization	claim.name
e87d80e2-8c34-4df1-8bda-70ac1f9db5cb	String	jsonType.label
1b145a9d-3d3e-4f42-b267-f21594b8808b	true	introspection.token.claim
1b145a9d-3d3e-4f42-b267-f21594b8808b	true	userinfo.token.claim
1b145a9d-3d3e-4f42-b267-f21594b8808b	locale	user.attribute
1b145a9d-3d3e-4f42-b267-f21594b8808b	true	id.token.claim
1b145a9d-3d3e-4f42-b267-f21594b8808b	true	access.token.claim
1b145a9d-3d3e-4f42-b267-f21594b8808b	locale	claim.name
1b145a9d-3d3e-4f42-b267-f21594b8808b	String	jsonType.label
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	true	introspection.token.claim
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	true	multivalued
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	true	userinfo.token.claim
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	true	id.token.claim
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	true	lightweight.claim
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	true	access.token.claim
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	String	jsonType.label
a0da8aa8-e4a9-4ca0-aac7-0519470ac56c	groups	claim.name
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
98deb0a8-a0bc-4d66-9005-e0960be33c64	60	300	7200				t	f	0	kaist	KAIST	0	\N	t	f	f	f	EXTERNAL	36000	36000	f	f	ea8b9ce7-318c-467e-bc99-85d8f7e99343	1800	f	\N	t	f	f	f	0	1	30	6	HmacSHA1	totp	25c211c7-72a9-4185-9e80-6fd78e1b3658	9eb62d75-be34-4a10-a919-671cbfa6e369	1883a086-83ca-467b-bcce-54cc1ac922f0	54e8c98c-220e-4e3b-80d8-40970f11fa92	abba2de3-bcc4-4376-a4cc-30dcf1d77847	2592000	f	7200	t	f	f2dfbfd1-fb95-4a25-a6c1-bbaefc44a463	0	f	0	0	38fb9f6f-411f-4a6f-b6f1-3a06eec22d69
1c48905a-b826-47d5-8c26-a03f5a248c68	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	0b9a450b-01db-4cd3-a6fd-08385c9ac602	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	92aa0893-d983-4ce7-bb95-f477bf502755	e5f64655-8f5e-41cf-86ab-62a81cf5857a	24a83ae9-52cd-4bab-8d85-e8dbc0c6ba10	41b0b013-4d02-4b3d-a916-f26a91ee7222	db0ba350-e259-467d-be57-1c60cb213f8f	2592000	f	900	t	f	3a183477-cd0f-4fa9-93ed-66248dc89735	0	f	0	0	b1ea3da8-e3b1-427a-9107-5c64ed6d4e12
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	1c48905a-b826-47d5-8c26-a03f5a248c68	
_browser_header.xContentTypeOptions	1c48905a-b826-47d5-8c26-a03f5a248c68	nosniff
_browser_header.referrerPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	no-referrer
_browser_header.xRobotsTag	1c48905a-b826-47d5-8c26-a03f5a248c68	none
_browser_header.xFrameOptions	1c48905a-b826-47d5-8c26-a03f5a248c68	SAMEORIGIN
_browser_header.contentSecurityPolicy	1c48905a-b826-47d5-8c26-a03f5a248c68	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	1c48905a-b826-47d5-8c26-a03f5a248c68	max-age=31536000; includeSubDomains
bruteForceProtected	1c48905a-b826-47d5-8c26-a03f5a248c68	false
permanentLockout	1c48905a-b826-47d5-8c26-a03f5a248c68	false
maxTemporaryLockouts	1c48905a-b826-47d5-8c26-a03f5a248c68	0
bruteForceStrategy	1c48905a-b826-47d5-8c26-a03f5a248c68	MULTIPLE
maxFailureWaitSeconds	1c48905a-b826-47d5-8c26-a03f5a248c68	900
minimumQuickLoginWaitSeconds	1c48905a-b826-47d5-8c26-a03f5a248c68	60
waitIncrementSeconds	1c48905a-b826-47d5-8c26-a03f5a248c68	60
quickLoginCheckMilliSeconds	1c48905a-b826-47d5-8c26-a03f5a248c68	1000
maxDeltaTimeSeconds	1c48905a-b826-47d5-8c26-a03f5a248c68	43200
failureFactor	1c48905a-b826-47d5-8c26-a03f5a248c68	30
realmReusableOtpCode	1c48905a-b826-47d5-8c26-a03f5a248c68	false
firstBrokerLoginFlowId	1c48905a-b826-47d5-8c26-a03f5a248c68	c653811b-3d31-4416-9025-1b7c4cb3acbb
displayName	1c48905a-b826-47d5-8c26-a03f5a248c68	Keycloak
displayNameHtml	1c48905a-b826-47d5-8c26-a03f5a248c68	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	1c48905a-b826-47d5-8c26-a03f5a248c68	RS256
offlineSessionMaxLifespanEnabled	1c48905a-b826-47d5-8c26-a03f5a248c68	false
offlineSessionMaxLifespan	1c48905a-b826-47d5-8c26-a03f5a248c68	5184000
_browser_header.contentSecurityPolicyReportOnly	98deb0a8-a0bc-4d66-9005-e0960be33c64	
_browser_header.xContentTypeOptions	98deb0a8-a0bc-4d66-9005-e0960be33c64	nosniff
_browser_header.referrerPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	no-referrer
_browser_header.xRobotsTag	98deb0a8-a0bc-4d66-9005-e0960be33c64	none
_browser_header.xFrameOptions	98deb0a8-a0bc-4d66-9005-e0960be33c64	SAMEORIGIN
_browser_header.contentSecurityPolicy	98deb0a8-a0bc-4d66-9005-e0960be33c64	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	98deb0a8-a0bc-4d66-9005-e0960be33c64	max-age=31536000; includeSubDomains
bruteForceProtected	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
permanentLockout	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
maxTemporaryLockouts	98deb0a8-a0bc-4d66-9005-e0960be33c64	0
bruteForceStrategy	98deb0a8-a0bc-4d66-9005-e0960be33c64	MULTIPLE
maxFailureWaitSeconds	98deb0a8-a0bc-4d66-9005-e0960be33c64	900
minimumQuickLoginWaitSeconds	98deb0a8-a0bc-4d66-9005-e0960be33c64	60
waitIncrementSeconds	98deb0a8-a0bc-4d66-9005-e0960be33c64	60
quickLoginCheckMilliSeconds	98deb0a8-a0bc-4d66-9005-e0960be33c64	1000
maxDeltaTimeSeconds	98deb0a8-a0bc-4d66-9005-e0960be33c64	43200
failureFactor	98deb0a8-a0bc-4d66-9005-e0960be33c64	30
realmReusableOtpCode	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
defaultSignatureAlgorithm	98deb0a8-a0bc-4d66-9005-e0960be33c64	RS256
offlineSessionMaxLifespanEnabled	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
offlineSessionMaxLifespan	98deb0a8-a0bc-4d66-9005-e0960be33c64	5184000
actionTokenGeneratedByAdminLifespan	98deb0a8-a0bc-4d66-9005-e0960be33c64	43200
actionTokenGeneratedByUserLifespan	98deb0a8-a0bc-4d66-9005-e0960be33c64	300
oauth2DeviceCodeLifespan	98deb0a8-a0bc-4d66-9005-e0960be33c64	600
oauth2DevicePollingInterval	98deb0a8-a0bc-4d66-9005-e0960be33c64	5
webAuthnPolicyRpEntityName	98deb0a8-a0bc-4d66-9005-e0960be33c64	keycloak
webAuthnPolicySignatureAlgorithms	98deb0a8-a0bc-4d66-9005-e0960be33c64	ES256,RS256
webAuthnPolicyRpId	98deb0a8-a0bc-4d66-9005-e0960be33c64	
webAuthnPolicyAttestationConveyancePreference	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyAuthenticatorAttachment	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyRequireResidentKey	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyUserVerificationRequirement	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyCreateTimeout	98deb0a8-a0bc-4d66-9005-e0960be33c64	0
webAuthnPolicyAvoidSameAuthenticatorRegister	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
webAuthnPolicyRpEntityNamePasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	ES256,RS256
webAuthnPolicyRpIdPasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	
webAuthnPolicyAttestationConveyancePreferencePasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyRequireResidentKeyPasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	not specified
webAuthnPolicyCreateTimeoutPasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
cibaBackchannelTokenDeliveryMode	98deb0a8-a0bc-4d66-9005-e0960be33c64	poll
cibaExpiresIn	98deb0a8-a0bc-4d66-9005-e0960be33c64	120
cibaInterval	98deb0a8-a0bc-4d66-9005-e0960be33c64	5
cibaAuthRequestedUserHint	98deb0a8-a0bc-4d66-9005-e0960be33c64	login_hint
parRequestUriLifespan	98deb0a8-a0bc-4d66-9005-e0960be33c64	60
firstBrokerLoginFlowId	98deb0a8-a0bc-4d66-9005-e0960be33c64	86d0ac47-a36f-4a86-a3ca-3633e3b64e82
organizationsEnabled	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
adminPermissionsEnabled	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
verifiableCredentialsEnabled	98deb0a8-a0bc-4d66-9005-e0960be33c64	false
clientSessionIdleTimeout	98deb0a8-a0bc-4d66-9005-e0960be33c64	0
clientSessionMaxLifespan	98deb0a8-a0bc-4d66-9005-e0960be33c64	0
clientOfflineSessionIdleTimeout	98deb0a8-a0bc-4d66-9005-e0960be33c64	0
clientOfflineSessionMaxLifespan	98deb0a8-a0bc-4d66-9005-e0960be33c64	0
client-policies.profiles	98deb0a8-a0bc-4d66-9005-e0960be33c64	{"profiles":[]}
client-policies.policies	98deb0a8-a0bc-4d66-9005-e0960be33c64	{"policies":[]}
darkMode	98deb0a8-a0bc-4d66-9005-e0960be33c64	true
shortVerificationUri	98deb0a8-a0bc-4d66-9005-e0960be33c64	
actionTokenGeneratedByUserLifespan.verify-email	98deb0a8-a0bc-4d66-9005-e0960be33c64	
actionTokenGeneratedByUserLifespan.idp-verify-account-via-email	98deb0a8-a0bc-4d66-9005-e0960be33c64	
actionTokenGeneratedByUserLifespan.reset-credentials	98deb0a8-a0bc-4d66-9005-e0960be33c64	
actionTokenGeneratedByUserLifespan.execute-actions	98deb0a8-a0bc-4d66-9005-e0960be33c64	
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
1c48905a-b826-47d5-8c26-a03f5a248c68	jboss-logging
98deb0a8-a0bc-4d66-9005-e0960be33c64	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	1c48905a-b826-47d5-8c26-a03f5a248c68
password	password	t	t	98deb0a8-a0bc-4d66-9005-e0960be33c64
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
deb3cf8d-fa1e-456c-88a7-e2693fe18e84	/realms/master/account/*
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	/realms/master/account/*
73329852-97b5-4c69-b546-a331a596c306	/admin/master/console/*
50ad5921-986f-4afb-ae73-e5e652a3de8d	/realms/KAIST/account/*
3c69f671-c1f7-4a18-9fe3-b3401476c57e	/realms/KAIST/account/*
fec5f95f-dd42-44f1-a854-96e37b0f7653	/admin/KAIST/console/*
ff26ec34-886e-4d94-904c-0282b67a4cc4	*
53669ecc-a88d-4ee6-9aea-7f774c824f0d	https://spaceai.kasi.re.kr/kaist-kasiai/cme_event_labeller/
53669ecc-a88d-4ee6-9aea-7f774c824f0d	*
53669ecc-a88d-4ee6-9aea-7f774c824f0d	https://spaceai.kasi.re.kr/kaist-kasiai/*
53669ecc-a88d-4ee6-9aea-7f774c824f0d	https://kasiai.kaist.ac.kr/*
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
562bf4ed-a7b4-4a63-9d82-d05569a0958c	VERIFY_EMAIL	Verify Email	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	VERIFY_EMAIL	50
896e030a-57b9-4f09-aef5-abfb60cdc7ad	UPDATE_PROFILE	Update Profile	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	UPDATE_PROFILE	40
23349133-b070-40a2-bf61-c2076cbf6a5d	CONFIGURE_TOTP	Configure OTP	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	CONFIGURE_TOTP	10
ee45aaf4-6263-4278-b085-5f0f79bad55b	UPDATE_PASSWORD	Update Password	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	UPDATE_PASSWORD	30
e4bb0953-1951-4ba1-b30b-0493fe0bec90	TERMS_AND_CONDITIONS	Terms and Conditions	1c48905a-b826-47d5-8c26-a03f5a248c68	f	f	TERMS_AND_CONDITIONS	20
9c853ed1-e9d0-4a61-91b2-11cd211a3ccd	delete_account	Delete Account	1c48905a-b826-47d5-8c26-a03f5a248c68	f	f	delete_account	60
846b11ae-a92d-4982-b767-deabb198bf9c	delete_credential	Delete Credential	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	delete_credential	100
3a906e2a-70f4-44f0-bf38-becc3a8b2417	update_user_locale	Update User Locale	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	update_user_locale	1000
02e2558d-ba97-437c-a273-0aaea5e7643b	webauthn-register	Webauthn Register	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	webauthn-register	70
5a2c9fa2-8ece-43d3-84f0-1a903c51922c	webauthn-register-passwordless	Webauthn Register Passwordless	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	webauthn-register-passwordless	80
67d83465-a649-4dac-a16d-02f1016e1dcf	VERIFY_PROFILE	Verify Profile	1c48905a-b826-47d5-8c26-a03f5a248c68	t	f	VERIFY_PROFILE	90
bde83cca-74d2-4ee0-8a21-335dcbf26627	VERIFY_EMAIL	Verify Email	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	VERIFY_EMAIL	50
726bc0b1-7a30-41e1-b3a7-80b01b2ca8a9	UPDATE_PROFILE	Update Profile	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	UPDATE_PROFILE	40
b65531b1-f3e2-40b8-9bee-e05cc2404cd1	CONFIGURE_TOTP	Configure OTP	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	CONFIGURE_TOTP	10
0d428493-3024-47b8-862b-dd3174013b49	UPDATE_PASSWORD	Update Password	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	UPDATE_PASSWORD	30
2de1cb15-ff34-4b90-b4b2-c349b7517928	TERMS_AND_CONDITIONS	Terms and Conditions	98deb0a8-a0bc-4d66-9005-e0960be33c64	f	f	TERMS_AND_CONDITIONS	20
f0f03dca-3e49-4db8-b009-f52934ef0e4e	delete_account	Delete Account	98deb0a8-a0bc-4d66-9005-e0960be33c64	f	f	delete_account	60
2b866e08-eac7-4205-860d-4521e4ca323b	delete_credential	Delete Credential	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	delete_credential	100
81c2a9c7-b476-45f1-a082-7bd4d6578a77	update_user_locale	Update User Locale	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	update_user_locale	1000
207ae1a2-c5e4-471f-b9fa-ca2c302d7218	webauthn-register	Webauthn Register	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	webauthn-register	70
3ce00fc2-29da-4b68-b5a4-0de5d3424283	webauthn-register-passwordless	Webauthn Register Passwordless	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	webauthn-register-passwordless	80
01552bd9-cf49-4b53-8e1f-a04b8e08f15a	VERIFY_PROFILE	Verify Profile	98deb0a8-a0bc-4d66-9005-e0960be33c64	t	f	VERIFY_PROFILE	90
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	t	0	1
ff26ec34-886e-4d94-904c-0282b67a4cc4	t	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
37fa8420-3e9e-4f09-a745-f7316abf36c4	Default Policy	A policy that grants access only for users within this realm	js	0	0	9c9fff21-cf5c-4db2-8de6-b14f7a80660f	\N
20a46fc4-5fa0-450e-878d-ba92923d4ca4	Default Permission	A permission that applies to the default resource type	resource	1	0	9c9fff21-cf5c-4db2-8de6-b14f7a80660f	\N
56e60bf8-e687-457c-81c4-0d20fd5ab0e9	Default Policy	A policy that grants access only for users within this realm	js	0	0	ff26ec34-886e-4d94-904c-0282b67a4cc4	\N
fe025fc7-db60-4800-9e44-86cd9c082362	Default Permission	A permission that applies to the default resource type	resource	1	0	ff26ec34-886e-4d94-904c-0282b67a4cc4	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
6652dc98-8146-4cb0-a104-514b0c17baf0	Default Resource	urn:Jupyter:resources:default	\N	9c9fff21-cf5c-4db2-8de6-b14f7a80660f	9c9fff21-cf5c-4db2-8de6-b14f7a80660f	f	\N
5ba12bae-5b9d-4952-b84b-7d5dc6526c84	Default Resource	urn:KAIST-contest:resources:default	\N	ff26ec34-886e-4d94-904c-0282b67a4cc4	ff26ec34-886e-4d94-904c-0282b67a4cc4	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
6652dc98-8146-4cb0-a104-514b0c17baf0	/*
5ba12bae-5b9d-4952-b84b-7d5dc6526c84	/*
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	e536c814-8b9c-493e-bfb0-b51151bc3c56
88e4ebb1-16e1-4d36-aaf8-3c76dc0d1f3a	6fc23fa0-7dfe-46dd-834c-802f56720692
3c69f671-c1f7-4a18-9fe3-b3401476c57e	05363fb5-cb59-4774-aa56-8003f10c1baf
3c69f671-c1f7-4a18-9fe3-b3401476c57e	01c3804d-d393-4a9e-a8ca-904e71f93ce7
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.server_config (server_config_key, value, version) FROM stdin;
crt_jgroups	{"prvKey":"MIIEpAIBAAKCAQEAwjglzhpYQIUBrRH0UEZolRHlbFFdv24YQ25kZFdlr+XxNZ0enDTemYPPajfhKwdPLLt4Ml7cDPyUtDzadgnN7eGKEkCgWf5uXvPLj4RlkxsvYYbKq1qVf6NjG0m0W6tF3N3fmv6WuImsOm68XNtq3Hs4d7iY6MlAyWcYb7GsdYyTz3N3eI/AwncZqY7UwnlR4714CTAQZq2nPZd/2WZuWOtOWh+Y08qJ5bevSHdxfPHa8jqaRllGNcyYEPPvvIlclE/Pn8KXpDgGQDYuJjKNdUtHdqii7/wV8donqiSHr4cTGHc+4qRAPQUGfUOUQXV4dGz9Q81YWlv9n6lfmDvIyQIDAQABAoIBABYTPbDMa8WBmKwsQ0GwjwiKjTIfmXE9uUJI1N5W1LcGgsEeR7FnjPmT8spW6Z/zZ7tk34eSIp7TQq+tzwLloGNuZDwo3lD8S109hqCcYtMyntMN+BE77YwhbQ1X9kkJEZrGGTlLwKPe+hV2KrC/O8kttEBfWfnzjgqWTj+7ySdfDUhwh2yQEzd5f6WRv9esc+qm30FscrqvQ1mXMkZDDH8yYCPyXD9WeNsDJBhe9sl6vrMThVvCiI8jYJ3XVyPrW4Og/bvF4EH2YXo9+oofC1luqxNOht5uI8eXpTBTdeOi+kDa9F0kD3IVnCPo/sYIFE9TnVRHwanPZ06OQT5KbCUCgYEA73iTxbkwG01IewXGMW7Af5nWHDzBGoS08S9qamTPMHK0jdlTQv4VRIWhCUqbBzWDG+fXbqnxUqmJoM8fdYNnAoojN9UVu31MT7hIxjIGIPTCJR/9t2uNSXO/nR0SCunX6zNBnNrloXNLJuJKjUyMfWkwu+hcr87EeaAwJqdNqgsCgYEAz5/6m7/fOWxcDHl23VvA8jZJlS5sjK4/2Yb1GsQ+EVEZh0VcQfskt3UNbzFo1Vn49tvYyzOouOUIp0cOJVyv3Dj298lzka8qAVxnLQuXfs2nmalnG5kn5HSjXSc4a9NvgwreXhVW4WLl49CL2p9Ojs7jtAsn3vaS+aM/WvIcMPsCgYEAyQyklAYMW3+g8JhCc1IWj4qqdf6T6R2thChY4YZNZNGIwObKvp3vYR4Hu3NFgOHud0lIV4KaNtpb0ATU1qZBn6I2OzPNESH7JZsEjlGFT7nuHZkkPBAyCI8DOncjpMH7I15fIb+ttsTDPZwTF1pDQS9FWR2WY4vm7G4OvwULcU0CgYEAvLsKfkuCqVsjrT84Wm1OTZ4lcxMZHyRB7AUuhl8+oFUdJIZbH6sgLBed16aNSesYUaV0Qvo5c6DWJeCELlg7j67EaGdZw2L7hvMs4ph35I8iu55umHq29YdE/KdrNTCkW/UkP1ecexKAMH7gsiE/srbD62R8oMN4xK2tKImOMMMCgYABdw86JpRReX92qxpGTtpldsAHJhvu7RwL5V2KjL7KJCJFnv83IKO5vm/XqSRStQ97f6Ed6ezsFGdWL6jgmVwFK5PDGEeBPGE+5Se4wRJGGZdARyquSpvdiyo+q9Di0RbC2B7xJmQlGjKZTAIYIXckj9pk36DiHlIy4IeBQcu3Ug==","pubKey":"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwjglzhpYQIUBrRH0UEZolRHlbFFdv24YQ25kZFdlr+XxNZ0enDTemYPPajfhKwdPLLt4Ml7cDPyUtDzadgnN7eGKEkCgWf5uXvPLj4RlkxsvYYbKq1qVf6NjG0m0W6tF3N3fmv6WuImsOm68XNtq3Hs4d7iY6MlAyWcYb7GsdYyTz3N3eI/AwncZqY7UwnlR4714CTAQZq2nPZd/2WZuWOtOWh+Y08qJ5bevSHdxfPHa8jqaRllGNcyYEPPvvIlclE/Pn8KXpDgGQDYuJjKNdUtHdqii7/wV8donqiSHr4cTGHc+4qRAPQUGfUOUQXV4dGz9Q81YWlv9n6lfmDvIyQIDAQAB","crt":"MIICnTCCAYUCBgGXhwsCLjANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdqZ3JvdXBzMB4XDTI1MDYxOTA3MTM1NVoXDTI1MDgxODA3MTUzM1owEjEQMA4GA1UEAwwHamdyb3VwczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMI4Jc4aWECFAa0R9FBGaJUR5WxRXb9uGENuZGRXZa/l8TWdHpw03pmDz2o34SsHTyy7eDJe3Az8lLQ82nYJze3hihJAoFn+bl7zy4+EZZMbL2GGyqtalX+jYxtJtFurRdzd35r+lriJrDpuvFzbatx7OHe4mOjJQMlnGG+xrHWMk89zd3iPwMJ3GamO1MJ5UeO9eAkwEGatpz2Xf9lmbljrTlofmNPKieW3r0h3cXzx2vI6mkZZRjXMmBDz77yJXJRPz5/Cl6Q4BkA2LiYyjXVLR3aoou/8FfHaJ6okh6+HExh3PuKkQD0FBn1DlEF1eHRs/UPNWFpb/Z+pX5g7yMkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAqBw/itQAwgokodBwOl3cA7OhtnRKdN6loefmIAn2yxQ24aGkC4ZKkNpXkA0GmGasSOSZfzXrwV7F/7irWP69zntk53DNt/hmgPKxGyqU20r8U8/oCbi4BX8OxWznFUogyVijXhJLh9Tb1SbDDbSyidgE00AY3OSDeokCw5ueMT5osZowNOyIKTMZwNa8dJyvo3LPH/LK2ggcRXSzE9XIDPfyTMNxVWvK6UVKegs+xHYQmm402qgDC1iLbDGrZMYDlhh9ZFvI8Kw044L4596YgLL/6ILO+6Y7FdeV4DP9Ga8QGiuTPJQtyq+REV1dMv+pJP9dZfelHj723qq+WtcCCw==","alias":"9446e3ea-fa93-4c3d-b232-ebf9f0495b5c","generatedMillis":1750317335386}	0
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	33a3d791-d25e-4142-bcc0-f58cbaf37e73	4122486c-fee3-4fa6-98e4-0ec9e432d8ea	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
33a3d791-d25e-4142-bcc0-f58cbaf37e73	\N	4bb44d86-554a-4448-a434-d20975cf50dd	f	t	\N	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	tempadmin	1750317351585	\N	0
cf7e5366-b07d-4cac-8ef1-373632a60818	admin@example.com	admin@example.com	t	t	\N	\N	\N	1c48905a-b826-47d5-8c26-a03f5a248c68	admin	1750317553879	\N	0
a557e1e1-4418-4b1e-8937-7a02a602f373	\N	9b63943b-ef9d-44dd-a172-8e0e2d043a62	f	t	\N	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	service-account-jupyter	1750317716033	9c9fff21-cf5c-4db2-8de6-b14f7a80660f	0
da898d46-5400-4dd1-a90d-a091a8d3dce7	\N	f5fe0059-997e-42f2-a917-ae96efdce789	f	t	\N	\N	\N	98deb0a8-a0bc-4d66-9005-e0960be33c64	service-account-kaist-contest	1750317740146	ff26ec34-886e-4d94-904c-0282b67a4cc4	0
43a93a2b-d34a-49a3-9f73-203329648b14	cwkim@kaist.edu	cwkim@kaist.edu	t	t	\N	찬우	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	cwkim@kaist.edu	1750416390578	\N	0
eb931243-5526-4798-9281-26f371b43659	lyms0918@yonsei.ac.kr	lyms0918@yonsei.ac.kr	f	t	\N	예진	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	lyms0918@yonsei.ac.kr	1750773217320	\N	0
96db1114-75e1-4a83-a16f-f8dcf76ed677	dielion44@chungbuk.ac.kr	dielion44@chungbuk.ac.kr	f	t	\N	도희	권	98deb0a8-a0bc-4d66-9005-e0960be33c64	dielion44@chungbuk.ac.kr	1750561766286	\N	0
0fa69601-b3fc-43ea-9976-c33995c633b3	yc424k@gmail.com	yc424k@gmail.com	f	t	\N	유청	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	yc424k@gmail.com	1750567424664	\N	0
e2e547ff-452e-47bf-90b7-3b0ccb56873a	selfsee@gmail.com	selfsee@gmail.com	f	t	\N	찬우	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	selfsee@gmail.com	1750647010151	\N	0
9ae585db-cae0-4d7e-b350-3c786117064d	thbrian@postech.ac.kr	thbrian@postech.ac.kr	f	t	\N	태호	제	98deb0a8-a0bc-4d66-9005-e0960be33c64	thbrian@postech.ac.kr	1750654070757	\N	0
ed137331-a9f0-4e84-b3b3-0ed5e026484d	ghkim@devstack.co.kr	ghkim@devstack.co.kr	t	t	\N	가현	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	ghkim@devstack.co.kr	1750399628147	\N	0
fa5e48e6-ce1d-43df-a401-735dff7e58b7	arlee@devstack.co.kr	arlee@devstack.co.kr	t	t	\N	아름	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	arlee@devstack.co.kr	1750640600821	\N	0
ec86151d-ca0c-4a7b-b2e2-b648fabd5216	neo81389@gmail.com	neo81389@gmail.com	f	t	\N	Joonhee	Lee	98deb0a8-a0bc-4d66-9005-e0960be33c64	neo81389@gmail.com	1750662456208	\N	0
c0125d7c-f131-4eb0-b81b-bfb2c63a4b10	jiwoo3853@gmail.com	jiwoo3853@gmail.com	f	t	\N	경민	최	98deb0a8-a0bc-4d66-9005-e0960be33c64	jiwoo3853@gmail.com	1750823673520	\N	0
f80339de-5607-4b05-9728-3fce984c7eee	dbseodud753@naver.com	dbseodud753@naver.com	f	t	\N	대영	윤	98deb0a8-a0bc-4d66-9005-e0960be33c64	dbseodud753@naver.com	1750835408930	\N	0
c2a1a253-894d-45af-9277-59bb74ee6587	imy01@daum.net	imy01@daum.net	f	t	\N	지현	유	98deb0a8-a0bc-4d66-9005-e0960be33c64	imy01@daum.net	1750850017544	\N	0
a06bf14a-791c-4bf8-99af-47de4ea2e802	downbeen100@korea.ac.kr	downbeen100@korea.ac.kr	f	t	\N	백	하빈	98deb0a8-a0bc-4d66-9005-e0960be33c64	downbeen100@korea.ac.kr	1750867697652	\N	0
493967e2-5d44-4046-b93b-d49990fb9358	lee_c2@denison.edu	lee_c2@denison.edu	f	t	\N	Chanhui	Lee	98deb0a8-a0bc-4d66-9005-e0960be33c64	lee_c2@denison.edu	1750871265900	\N	0
37d8ea36-1a01-447c-b0e9-9ab346381a15	zzzzz@snu.ac.kr	zzzzz@snu.ac.kr	f	t	\N	지용	윤	98deb0a8-a0bc-4d66-9005-e0960be33c64	zzzzz@snu.ac.kr	1750908675679	\N	0
caf9fb60-2a00-409e-8adb-af3c2eb57a43	jeongwonc392@gmail.com	jeongwonc392@gmail.com	f	t	\N	정원	최	98deb0a8-a0bc-4d66-9005-e0960be33c64	jeongwonc392@gmail.com	1750921517353	\N	0
d2b22925-ae27-4f9d-b78f-0f6467dbed57	suwoon.lee@innowithus.com	suwoon.lee@innowithus.com	f	t	\N	suwoon	lee	98deb0a8-a0bc-4d66-9005-e0960be33c64	suwoon.lee@innowithus.com	1750984043239	\N	0
b3dcbb2f-bc34-486e-8767-0f87d08a57bb	mehyein@postech.ac.kr	mehyein@postech.ac.kr	f	t	\N	hyein	you	98deb0a8-a0bc-4d66-9005-e0960be33c64	mehyein@postech.ac.kr	1750989828046	\N	0
1a9ad95a-5e37-4b58-8c94-14a0a7e8ffa8	test@test.com	test@test.com	f	t	\N	test	test	98deb0a8-a0bc-4d66-9005-e0960be33c64	test@test.com	1751011876561	\N	0
0d2036ad-4fa0-4e54-9f38-ec35be7de0e3	snowball88@knu.ac.kr	snowball88@knu.ac.kr	f	t	\N	지예	원	98deb0a8-a0bc-4d66-9005-e0960be33c64	snowball88@knu.ac.kr	1751101894724	\N	0
b049ccc7-f340-403f-8707-2987cf236da4	physicswoo@kaist.ac.kr	physicswoo@kaist.ac.kr	f	t	\N	현호	우	98deb0a8-a0bc-4d66-9005-e0960be33c64	physicswoo@kaist.ac.kr	1751110386781	\N	0
0733bc2e-fbe7-4e22-8334-eeb2a6d321f6	dongwon016@kaist.ac.kr	dongwon016@kaist.ac.kr	f	t	\N	동원	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	dongwon016@kaist.ac.kr	1751141125772	\N	0
b87843ff-6aab-4864-95a5-86d00784a693	dragondall2015@gmail.com	dragondall2015@gmail.com	f	t	\N	YOUNGJOON	SON	98deb0a8-a0bc-4d66-9005-e0960be33c64	dragondall2015@gmail.com	1751210747035	\N	0
41c7cd25-e849-4d00-9c0d-e02b934a45d4	smhm0411@gmail.com	smhm0411@gmail.com	f	t	\N	석민	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	smhm0411@gmail.com	1751384076343	\N	0
be1b8b0f-4467-4fb6-8aa0-f3bf31bc1d55	minseolee.astro@gmail.com	minseolee.astro@gmail.com	f	t	\N	민서	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	minseolee.astro@gmail.com	1751249063467	\N	0
174f49e0-ef59-4a4a-90d1-3bfb723b8fb4	chio4696@gmail.com	chio4696@gmail.com	f	t	\N	Chioh	Lee	98deb0a8-a0bc-4d66-9005-e0960be33c64	chio4696@gmail.com	1751389073072	\N	0
4c123de5-b7dd-4adc-becd-5064799b3b70	fmadkdl113@gmail.com	fmadkdl113@gmail.com	f	t	\N	아름	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	fmadkdl113@gmail.com	1751258439221	\N	0
a140f0e3-9e46-416b-9f2a-427925df02b7	kwondoyeob6879@naver.com	kwondoyeob6879@naver.com	f	t	\N	Kwon	doyub	98deb0a8-a0bc-4d66-9005-e0960be33c64	kwondoyeob6879@naver.com	1751268974044	\N	0
88bf5eae-b6d8-4d9c-a1ee-c161c74ea564	smham0713@gmail.com	smham0713@gmail.com	f	t	\N	승민	함	98deb0a8-a0bc-4d66-9005-e0960be33c64	smham0713@gmail.com	1751270671705	\N	0
a3c71daa-daa0-4485-ab75-c59de77aee4d	jiwon9603@naver.com	jiwon9603@naver.com	f	t	\N	지원	한	98deb0a8-a0bc-4d66-9005-e0960be33c64	jiwon9603@naver.com	1751439155827	\N	0
937d3525-b853-4296-8c5c-31f826458677	penguinoo@naver.com	penguinoo@naver.com	f	t	\N	정한	윤	98deb0a8-a0bc-4d66-9005-e0960be33c64	penguinoo@naver.com	1751271343329	\N	0
a101054b-6020-4173-91cc-e3575fb9d377	khb2439@gmail.com	khb2439@gmail.com	f	t	\N	현빈	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	khb2439@gmail.com	1751271421942	\N	0
053c73bd-f8db-46b7-a509-c75037e15172	tjddus8174@gmail.com	tjddus8174@gmail.com	f	t	\N	성연	장	98deb0a8-a0bc-4d66-9005-e0960be33c64	tjddus8174@gmail.com	1751440228639	\N	0
5d17a0a1-128d-4967-b15f-bb661b871381	mincong2@hanyang.ac.kr	mincong2@hanyang.ac.kr	f	t	\N	민서	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	mincong2@hanyang.ac.kr	1751279787210	\N	0
3fc506f7-07d4-4e7d-87d9-6f8aae3941de	dustj0406@naver.com	dustj0406@naver.com	f	t	\N	연서	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	dustj0406@naver.com	1751329137961	\N	0
108969c9-5c5a-4779-8cb6-3aeb0ddc1777	ktngus5043@gmail.com	ktngus5043@gmail.com	f	t	\N	수현	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	ktngus5043@gmail.com	1751445602439	\N	0
e9e94382-f6c7-4ee6-b3c0-676ff233b9f2	jwk9987@mail.ulsan.ac.kr	jwk9987@mail.ulsan.ac.kr	f	t	\N	종원	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	jwk9987@mail.ulsan.ac.kr	1751333505668	\N	0
395739de-af2b-4b32-ba80-36da99d6b0d2	sky.lee@kaist.ac.kr	sky.lee@kaist.ac.kr	f	t	\N	하늘	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	sky.lee@kaist.ac.kr	1751350019338	\N	0
d792826d-6aa0-48e6-a525-306e735bd5ce	jjeonghun129@gmail.com	jjeonghun129@gmail.com	f	t	\N	Jeonghun	Jeong	98deb0a8-a0bc-4d66-9005-e0960be33c64	jjeonghun129@gmail.com	1751445640361	\N	0
d7333d22-42ea-4b35-9def-7fe0d2c59fd1	ssj1123a@gmail.com	ssj1123a@gmail.com	f	t	\N	석진	서	98deb0a8-a0bc-4d66-9005-e0960be33c64	ssj1123a@gmail.com	1751358724320	\N	0
260ebc62-0717-427f-bb04-ac79ad166a7d	ntju789@naver.com	ntju789@naver.com	f	t	\N	서영	주	98deb0a8-a0bc-4d66-9005-e0960be33c64	ntju789@naver.com	1751362222344	\N	0
505a64a9-b535-44a7-8d72-9f0c9a7dd061	joongsun1918@gmail.com	joongsun1918@gmail.com	f	t	\N	중선	유	98deb0a8-a0bc-4d66-9005-e0960be33c64	joongsun1918@gmail.com	1751455773600	\N	0
0a8d87eb-6f1c-4418-ab79-681c6463f21c	suyeon8235@gmail.com	suyeon8235@gmail.com	f	t	\N	수연	명	98deb0a8-a0bc-4d66-9005-e0960be33c64	suyeon8235@gmail.com	1751362452500	\N	0
5000d671-512d-423c-8e86-d287b963d2db	uhm1215@naver.com	uhm1215@naver.com	f	t	\N	재영	엄	98deb0a8-a0bc-4d66-9005-e0960be33c64	uhm1215@naver.com	1751457620150	\N	0
4782b99d-7aa5-4d06-8767-bfdf3d0f1c2a	ssong072413@naver.com	ssong072413@naver.com	f	t	\N	Yerin	Song	98deb0a8-a0bc-4d66-9005-e0960be33c64	ssong072413@naver.com	1751461783408	\N	0
a8bbac7e-c5c4-448a-bf23-d7931be69c13	tgim4253@kaist.ac.kr	tgim4253@kaist.ac.kr	f	t	\N	김	태현	98deb0a8-a0bc-4d66-9005-e0960be33c64	tgim4253@kaist.ac.kr	1751470244936	\N	0
85b79e02-763d-4502-b1fd-247a9c2c42c0	wesley2003@kookmin.ac.kr	wesley2003@kookmin.ac.kr	f	t	\N	joon	sim	98deb0a8-a0bc-4d66-9005-e0960be33c64	wesley2003@kookmin.ac.kr	1751474707461	\N	0
13a74e6b-b98d-4e6b-97d1-01a103009dd9	serih0219@gmail.com	serih0219@gmail.com	f	t	\N	세리	유	98deb0a8-a0bc-4d66-9005-e0960be33c64	serih0219@gmail.com	1751523204158	\N	0
6751cf92-6f1e-4f97-b0d9-254d6371ce20	crane206265@kaist.ac.kr	crane206265@kaist.ac.kr	f	t	\N	학진	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	crane206265@kaist.ac.kr	1751527680636	\N	0
5c7db0d9-94ab-4f4a-b685-6ff51dfab3f7	jisu1237@gmail.com	jisu1237@gmail.com	f	t	\N	Jisu	Lee	98deb0a8-a0bc-4d66-9005-e0960be33c64	jisu1237@gmail.com	1751532121941	\N	0
a85c5cd0-ae81-45c4-b0ac-4885f9ef46c1	jisui1237@gmail.com	jisui1237@gmail.com	f	t	\N	Jisu	Lee	98deb0a8-a0bc-4d66-9005-e0960be33c64	jisui1237@gmail.com	1751532187344	\N	0
04184e6b-5a93-414a-af44-616b24cf9ccf	gardenpea@naver.com	gardenpea@naver.com	f	t	\N	규식	한	98deb0a8-a0bc-4d66-9005-e0960be33c64	gardenpea@naver.com	1751554965638	\N	0
39836209-d5e9-453d-9f5e-ce75a906bd60	byeol0102@naver.com	byeol0102@naver.com	f	t	\N	Chanbyeol	Lee	98deb0a8-a0bc-4d66-9005-e0960be33c64	byeol0102@naver.com	1751560380081	\N	0
a1c2b840-08df-4398-be4e-e59514183896	yun20203076@gs.cwnu.ac.kr	yun20203076@gs.cwnu.ac.kr	f	t	\N	은옥	윤	98deb0a8-a0bc-4d66-9005-e0960be33c64	yun20203076@gs.cwnu.ac.kr	1751594174368	\N	0
45d4877c-8133-40f9-871a-a5a8601b63c9	thk7574@naver.com	thk7574@naver.com	f	t	\N	태현	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	thk7574@naver.com	1751602623248	\N	0
7fcc687a-c5e7-41d2-ada0-1df63a51880e	jw123321@khu.ac.kr	jw123321@khu.ac.kr	f	t	\N	원철	주	98deb0a8-a0bc-4d66-9005-e0960be33c64	jw123321@khu.ac.kr	1751605316025	\N	0
dfcfd48a-afdd-47e9-9695-9aa0365f30c1	wonhoju37@gmail.com	wonhoju37@gmail.com	f	t	\N	원호	주	98deb0a8-a0bc-4d66-9005-e0960be33c64	wonhoju37@gmail.com	1751609093493	\N	0
303f4c38-656a-4a09-b16a-5b9e20c9a92c	redfrienz@gmail.com	redfrienz@gmail.com	f	t	\N	정우	홍	98deb0a8-a0bc-4d66-9005-e0960be33c64	redfrienz@gmail.com	1751613399564	\N	0
b64cf40f-ec10-491b-8e65-ee9df75b2335	id12@khu.ac.kr	id12@khu.ac.kr	f	t	\N	민하	주	98deb0a8-a0bc-4d66-9005-e0960be33c64	id12@khu.ac.kr	1751614900014	\N	0
d332cc9a-086f-4b78-9c9b-ed53404636cd	yunjh1212@gnu.ac.kr	yunjh1212@gnu.ac.kr	f	t	\N	정희	윤	98deb0a8-a0bc-4d66-9005-e0960be33c64	yunjh1212@gnu.ac.kr	1751619265887	\N	0
e52334b8-c138-4a4d-85fa-e2a35d7968e6	rmgalaxy@naver.com	rmgalaxy@naver.com	f	t	\N	동훈	이	98deb0a8-a0bc-4d66-9005-e0960be33c64	rmgalaxy@naver.com	1751621250823	\N	0
523b61ff-99d5-453a-a2ec-487ae0f1c552	hannahkhw99@gmail.com	hannahkhw99@gmail.com	f	t	\N	희원	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	hannahkhw99@gmail.com	1751636197199	\N	0
27f2d557-ea6c-4967-a1a4-eb4c7ec530fa	pikachuisabird@yonsei.ac.kr	pikachuisabird@yonsei.ac.kr	f	t	\N	수현	정	98deb0a8-a0bc-4d66-9005-e0960be33c64	pikachuisabird@yonsei.ac.kr	1751799218360	\N	0
ef869940-2e2b-43be-b15d-dd54c4862a90	daeil_kim@khu.ac.kr	daeil_kim@khu.ac.kr	f	t	\N	Daeil	Kim	98deb0a8-a0bc-4d66-9005-e0960be33c64	daeil_kim@khu.ac.kr	1751865271955	\N	0
2bf7f5bd-82e6-4764-860f-247f774e5c59	yeoungje@khu.ac.kr	yeoungje@khu.ac.kr	t	t	\N	영재	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	yeoungje@khu.ac.kr	1751871428633	\N	0
905d3736-39ff-4b84-a0bf-ab926a86b07c	why2s2o7612@gmail.com	why2s2o7612@gmail.com	f	t	\N	Yeseo	Kim	98deb0a8-a0bc-4d66-9005-e0960be33c64	why2s2o7612@gmail.com	1751940638224	\N	0
6b42945e-0f3e-44a5-8ee8-5dc5930ed116	chaerikim@devstack.co.kr	chaerikim@devstack.co.kr	f	t	\N	채리	김	98deb0a8-a0bc-4d66-9005-e0960be33c64	chaerikim@devstack.co.kr	1751957987636	\N	0
3ea0f5b1-93df-4dfa-9099-2ad50590d7ef	kyeun1@naver.com	kyeun1@naver.com	f	t	\N	Yeeun	Kim	98deb0a8-a0bc-4d66-9005-e0960be33c64	kyeun1@naver.com	1752654320191	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
b1ea3da8-e3b1-427a-9107-5c64ed6d4e12	33a3d791-d25e-4142-bcc0-f58cbaf37e73
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	33a3d791-d25e-4142-bcc0-f58cbaf37e73
b1ea3da8-e3b1-427a-9107-5c64ed6d4e12	cf7e5366-b07d-4cac-8ef1-373632a60818
5556f4ff-3c41-4b0e-9886-f491d9d2b9b4	cf7e5366-b07d-4cac-8ef1-373632a60818
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a557e1e1-4418-4b1e-8937-7a02a602f373
914ea730-0919-458e-a991-8806296ee7df	a557e1e1-4418-4b1e-8937-7a02a602f373
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	da898d46-5400-4dd1-a90d-a091a8d3dce7
4d258f42-372f-4798-898a-619aef5263c3	da898d46-5400-4dd1-a90d-a091a8d3dce7
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	ed137331-a9f0-4e84-b3b3-0ed5e026484d
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	43a93a2b-d34a-49a3-9f73-203329648b14
addcc8a6-0034-46f9-a320-9500b998a79b	43a93a2b-d34a-49a3-9f73-203329648b14
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	96db1114-75e1-4a83-a16f-f8dcf76ed677
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	0fa69601-b3fc-43ea-9976-c33995c633b3
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	fa5e48e6-ce1d-43df-a401-735dff7e58b7
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	e2e547ff-452e-47bf-90b7-3b0ccb56873a
addcc8a6-0034-46f9-a320-9500b998a79b	ed137331-a9f0-4e84-b3b3-0ed5e026484d
addcc8a6-0034-46f9-a320-9500b998a79b	fa5e48e6-ce1d-43df-a401-735dff7e58b7
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	9ae585db-cae0-4d7e-b350-3c786117064d
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	ec86151d-ca0c-4a7b-b2e2-b648fabd5216
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	eb931243-5526-4798-9281-26f371b43659
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	c0125d7c-f131-4eb0-b81b-bfb2c63a4b10
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	f80339de-5607-4b05-9728-3fce984c7eee
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	c2a1a253-894d-45af-9277-59bb74ee6587
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a06bf14a-791c-4bf8-99af-47de4ea2e802
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	493967e2-5d44-4046-b93b-d49990fb9358
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	37d8ea36-1a01-447c-b0e9-9ab346381a15
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	caf9fb60-2a00-409e-8adb-af3c2eb57a43
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	d2b22925-ae27-4f9d-b78f-0f6467dbed57
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	b3dcbb2f-bc34-486e-8767-0f87d08a57bb
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	1a9ad95a-5e37-4b58-8c94-14a0a7e8ffa8
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	0d2036ad-4fa0-4e54-9f38-ec35be7de0e3
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	b049ccc7-f340-403f-8707-2987cf236da4
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	0733bc2e-fbe7-4e22-8334-eeb2a6d321f6
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	b87843ff-6aab-4864-95a5-86d00784a693
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	be1b8b0f-4467-4fb6-8aa0-f3bf31bc1d55
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	4c123de5-b7dd-4adc-becd-5064799b3b70
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a140f0e3-9e46-416b-9f2a-427925df02b7
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	88bf5eae-b6d8-4d9c-a1ee-c161c74ea564
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	937d3525-b853-4296-8c5c-31f826458677
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a101054b-6020-4173-91cc-e3575fb9d377
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	5d17a0a1-128d-4967-b15f-bb661b871381
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	3fc506f7-07d4-4e7d-87d9-6f8aae3941de
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	e9e94382-f6c7-4ee6-b3c0-676ff233b9f2
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	395739de-af2b-4b32-ba80-36da99d6b0d2
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	d7333d22-42ea-4b35-9def-7fe0d2c59fd1
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	260ebc62-0717-427f-bb04-ac79ad166a7d
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	0a8d87eb-6f1c-4418-ab79-681c6463f21c
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	41c7cd25-e849-4d00-9c0d-e02b934a45d4
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	174f49e0-ef59-4a4a-90d1-3bfb723b8fb4
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a3c71daa-daa0-4485-ab75-c59de77aee4d
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	053c73bd-f8db-46b7-a509-c75037e15172
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	108969c9-5c5a-4779-8cb6-3aeb0ddc1777
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	d792826d-6aa0-48e6-a525-306e735bd5ce
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	505a64a9-b535-44a7-8d72-9f0c9a7dd061
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	5000d671-512d-423c-8e86-d287b963d2db
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	4782b99d-7aa5-4d06-8767-bfdf3d0f1c2a
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a8bbac7e-c5c4-448a-bf23-d7931be69c13
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	85b79e02-763d-4502-b1fd-247a9c2c42c0
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	13a74e6b-b98d-4e6b-97d1-01a103009dd9
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	6751cf92-6f1e-4f97-b0d9-254d6371ce20
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	5c7db0d9-94ab-4f4a-b685-6ff51dfab3f7
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a85c5cd0-ae81-45c4-b0ac-4885f9ef46c1
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	04184e6b-5a93-414a-af44-616b24cf9ccf
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	39836209-d5e9-453d-9f5e-ce75a906bd60
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	a1c2b840-08df-4398-be4e-e59514183896
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	45d4877c-8133-40f9-871a-a5a8601b63c9
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	7fcc687a-c5e7-41d2-ada0-1df63a51880e
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	dfcfd48a-afdd-47e9-9695-9aa0365f30c1
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	303f4c38-656a-4a09-b16a-5b9e20c9a92c
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	b64cf40f-ec10-491b-8e65-ee9df75b2335
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	d332cc9a-086f-4b78-9c9b-ed53404636cd
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	e52334b8-c138-4a4d-85fa-e2a35d7968e6
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	523b61ff-99d5-453a-a2ec-487ae0f1c552
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	27f2d557-ea6c-4967-a1a4-eb4c7ec530fa
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	ef869940-2e2b-43be-b15d-dd54c4862a90
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	2bf7f5bd-82e6-4764-860f-247f774e5c59
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	905d3736-39ff-4b84-a0bf-ab926a86b07c
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	6b42945e-0f3e-44a5-8ee8-5dc5930ed116
addcc8a6-0034-46f9-a320-9500b998a79b	6b42945e-0f3e-44a5-8ee8-5dc5930ed116
eddf40aa-2d0f-4b3a-a646-2e37bf9ba684	ed137331-a9f0-4e84-b3b3-0ed5e026484d
eddf40aa-2d0f-4b3a-a646-2e37bf9ba684	6b42945e-0f3e-44a5-8ee8-5dc5930ed116
eddf40aa-2d0f-4b3a-a646-2e37bf9ba684	43a93a2b-d34a-49a3-9f73-203329648b14
38fb9f6f-411f-4a6f-b6f1-3a06eec22d69	3ea0f5b1-93df-4dfa-9099-2ad50590d7ef
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
73329852-97b5-4c69-b546-a331a596c306	+
fec5f95f-dd42-44f1-a854-96e37b0f7653	+
ff26ec34-886e-4d94-904c-0282b67a4cc4	*
53669ecc-a88d-4ee6-9aea-7f774c824f0d	*
9c9fff21-cf5c-4db2-8de6-b14f7a80660f	*
\.


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

