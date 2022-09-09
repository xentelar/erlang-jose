%% -*- mode: erlang; tab-width: 4; indent-tabs-mode: nil; st-rulers: [132] -*-
%% vim: ts=4 sw=4 ft=erlang et
%%% % @format
%%%-------------------------------------------------------------------
%%% @author Andrew Bennett <potatosaladx@gmail.com>
%%% @copyright 2014-2022, Andrew Bennett
%%% @doc
%%%
%%% @end
%%% Created :  07 Sep 2022 by Andrew Bennett <potatosaladx@gmail.com>
%%%-------------------------------------------------------------------
-module(jose_jwa_pbkdf2_hmac).

-behaviour(jose_provider).
-behaviour(jose_pbkdf2_hmac).

%% jose_provider callbacks
-export([provider_info/0]).
%% jose_pbkdf2_hmac callbacks
-export([
	pbkdf2_hmac_sha256/4,
	pbkdf2_hmac_sha384/4,
	pbkdf2_hmac_sha512/4
]).

%%====================================================================
%% jose_provider callbacks
%%====================================================================

-spec provider_info() -> jose_provider:info().
provider_info() ->
	#{
		behaviour => jose_pbkdf2_hmac,
		priority => low,
		requirements => [
			{app, crypto},
			crypto,
            {app, jose},
            jose_jwa_pkcs5
		]
	}.

%%====================================================================
%% jose_pbkdf2_hmac callbacks
%%====================================================================

-spec pbkdf2_hmac_sha256(Password, Salt, Iterations, KeyLen) -> Key when
	Password :: jose_pbkdf2_hmac:password(),
	Salt :: jose_pbkdf2_hmac:salt(),
	Iterations :: jose_pbkdf2_hmac:iterations(),
	KeyLen :: jose_pbkdf2_hmac:key_len(),
	Key :: jose_pbkdf2_hmac:key().
pbkdf2_hmac_sha256(Password, Salt, Iterations, KeyLen)
		when is_binary(Password)
		andalso is_binary(Salt)
		andalso (is_integer(Iterations) andalso Iterations >= 1)
		andalso (is_integer(KeyLen) andalso KeyLen >= 1) ->
    {ok, Key} = jose_jwa_pkcs5:pbkdf2({hmac, sha256}, Password, Salt, Iterations, KeyLen),
    Key.

-spec pbkdf2_hmac_sha384(Password, Salt, Iterations, KeyLen) -> Key when
	Password :: jose_pbkdf2_hmac:password(),
	Salt :: jose_pbkdf2_hmac:salt(),
	Iterations :: jose_pbkdf2_hmac:iterations(),
	KeyLen :: jose_pbkdf2_hmac:key_len(),
	Key :: jose_pbkdf2_hmac:key().
pbkdf2_hmac_sha384(Password, Salt, Iterations, KeyLen)
		when is_binary(Password)
		andalso is_binary(Salt)
		andalso (is_integer(Iterations) andalso Iterations >= 1)
		andalso (is_integer(KeyLen) andalso KeyLen >= 1) ->
    {ok, Key} = jose_jwa_pkcs5:pbkdf2({hmac, sha384}, Password, Salt, Iterations, KeyLen),
    Key.

-spec pbkdf2_hmac_sha512(Password, Salt, Iterations, KeyLen) -> Key when
	Password :: jose_pbkdf2_hmac:password(),
	Salt :: jose_pbkdf2_hmac:salt(),
	Iterations :: jose_pbkdf2_hmac:iterations(),
	KeyLen :: jose_pbkdf2_hmac:key_len(),
	Key :: jose_pbkdf2_hmac:key().
pbkdf2_hmac_sha512(Password, Salt, Iterations, KeyLen)
		when is_binary(Password)
		andalso is_binary(Salt)
		andalso (is_integer(Iterations) andalso Iterations >= 1)
		andalso (is_integer(KeyLen) andalso KeyLen >= 1) ->
    {ok, Key} = jose_jwa_pkcs5:pbkdf2({hmac, sha512}, Password, Salt, Iterations, KeyLen),
    Key.
