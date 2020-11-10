# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.AccessAnalyzer do
  @moduledoc """
  AWS IAM Access Analyzer helps identify potential resource-access risks by
  enabling you to identify any policies that grant access to an external
  principal.

  It does this by using logic-based reasoning to analyze resource-based policies
  in your AWS environment. An external principal can be another AWS account, a
  root user, an IAM user or role, a federated user, an AWS service, or an
  anonymous user. This guide describes the AWS IAM Access Analyzer operations that
  you can call programmatically. For general information about Access Analyzer,
  see the [AWS IAM Access Analyzer section of the IAM User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html).

  To start using Access Analyzer, you first need to create an analyzer.
  """

  @doc """
  Creates an analyzer for your account.
  """
  def create_analyzer(client, input, options \\ []) do
    path_ = "/analyzer"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @doc """
  Creates an archive rule for the specified analyzer.

  Archive rules automatically archive findings that meet the criteria you define
  when you create the rule.
  """
  def create_archive_rule(client, analyzer_name, input, options \\ []) do
    path_ = "/analyzer/#{URI.encode(analyzer_name)}/archive-rule"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @doc """
  Deletes the specified analyzer.

  When you delete an analyzer, Access Analyzer is disabled for the account in the
  current or specific Region. All findings that were generated by the analyzer are
  deleted. You cannot undo this action.
  """
  def delete_analyzer(client, analyzer_name, input, options \\ []) do
    path_ = "/analyzer/#{URI.encode(analyzer_name)}"
    headers = []
    {query_, input} =
      [
        {"clientToken", "clientToken"},
      ]
      |> AWS.Request.build_params(input)
    request(client, :delete, path_, query_, headers, input, options, 200)
  end

  @doc """
  Deletes the specified archive rule.
  """
  def delete_archive_rule(client, analyzer_name, rule_name, input, options \\ []) do
    path_ = "/analyzer/#{URI.encode(analyzer_name)}/archive-rule/#{URI.encode(rule_name)}"
    headers = []
    {query_, input} =
      [
        {"clientToken", "clientToken"},
      ]
      |> AWS.Request.build_params(input)
    request(client, :delete, path_, query_, headers, input, options, 200)
  end

  @doc """
  Retrieves information about a resource that was analyzed.
  """
  def get_analyzed_resource(client, analyzer_arn, resource_arn, options \\ []) do
    path_ = "/analyzed-resource"
    headers = []
    query_ = []
    query_ = if !is_nil(resource_arn) do
      [{"resourceArn", resource_arn} | query_]
    else
      query_
    end
    query_ = if !is_nil(analyzer_arn) do
      [{"analyzerArn", analyzer_arn} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Retrieves information about the specified analyzer.
  """
  def get_analyzer(client, analyzer_name, options \\ []) do
    path_ = "/analyzer/#{URI.encode(analyzer_name)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Retrieves information about an archive rule.
  """
  def get_archive_rule(client, analyzer_name, rule_name, options \\ []) do
    path_ = "/analyzer/#{URI.encode(analyzer_name)}/archive-rule/#{URI.encode(rule_name)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Retrieves information about the specified finding.
  """
  def get_finding(client, id, analyzer_arn, options \\ []) do
    path_ = "/finding/#{URI.encode(id)}"
    headers = []
    query_ = []
    query_ = if !is_nil(analyzer_arn) do
      [{"analyzerArn", analyzer_arn} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Retrieves a list of resources of the specified type that have been analyzed by
  the specified analyzer..
  """
  def list_analyzed_resources(client, input, options \\ []) do
    path_ = "/analyzed-resource"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Retrieves a list of analyzers.
  """
  def list_analyzers(client, max_results \\ nil, next_token \\ nil, type \\ nil, options \\ []) do
    path_ = "/analyzer"
    headers = []
    query_ = []
    query_ = if !is_nil(type) do
      [{"type", type} | query_]
    else
      query_
    end
    query_ = if !is_nil(next_token) do
      [{"nextToken", next_token} | query_]
    else
      query_
    end
    query_ = if !is_nil(max_results) do
      [{"maxResults", max_results} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Retrieves a list of archive rules created for the specified analyzer.
  """
  def list_archive_rules(client, analyzer_name, max_results \\ nil, next_token \\ nil, options \\ []) do
    path_ = "/analyzer/#{URI.encode(analyzer_name)}/archive-rule"
    headers = []
    query_ = []
    query_ = if !is_nil(next_token) do
      [{"nextToken", next_token} | query_]
    else
      query_
    end
    query_ = if !is_nil(max_results) do
      [{"maxResults", max_results} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Retrieves a list of findings generated by the specified analyzer.
  """
  def list_findings(client, input, options \\ []) do
    path_ = "/finding"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Retrieves a list of tags applied to the specified resource.
  """
  def list_tags_for_resource(client, resource_arn, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, 200)
  end

  @doc """
  Immediately starts a scan of the policies applied to the specified resource.
  """
  def start_resource_scan(client, input, options \\ []) do
    path_ = "/resource/scan"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Adds a tag to the specified resource.
  """
  def tag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 200)
  end

  @doc """
  Removes a tag from the specified resource.
  """
  def untag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    {query_, input} =
      [
        {"tagKeys", "tagKeys"},
      ]
      |> AWS.Request.build_params(input)
    request(client, :delete, path_, query_, headers, input, options, 200)
  end

  @doc """
  Updates the criteria and values for the specified archive rule.
  """
  def update_archive_rule(client, analyzer_name, rule_name, input, options \\ []) do
    path_ = "/analyzer/#{URI.encode(analyzer_name)}/archive-rule/#{URI.encode(rule_name)}"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @doc """
  Updates the status for the specified findings.
  """
  def update_findings(client, input, options \\ []) do
    path_ = "/finding"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, 200)
  end

  @spec request(AWS.Client.t(), binary(), binary(), list(), list(), map(), list(), pos_integer()) ::
          {:ok, map() | nil, map()}
          | {:error, term()}
  defp request(client, method, path, query, headers, input, options, success_status_code) do
    client = %{client | service: "access-analyzer"}
    host = build_host("access-analyzer", client)
    url = host
    |> build_url(path, client)
    |> add_query(query, client)

    additional_headers = [{"Host", host}, {"Content-Type", "application/x-amz-json-1.1"}]
    headers = AWS.Request.add_headers(additional_headers, headers)

    payload = encode!(client, input)
    headers = AWS.Request.sign_v4(client, method, url, headers, payload)
    perform_request(client, method, url, payload, headers, options, success_status_code)
  end

  defp perform_request(client, method, url, payload, headers, options, success_status_code) do
    case AWS.Client.request(client, method, url, payload, headers, options) do
      {:ok, %{status_code: status_code, body: body} = response}
      when is_nil(success_status_code) and status_code in [200, 202, 204]
      when status_code == success_status_code ->
        body = if(body != "", do: decode!(client, body))
        {:ok, body, response}

      {:ok, response} ->
        {:error, {:unexpected_response, response}}

      error = {:error, _reason} -> error
    end
  end


  defp build_host(_endpoint_prefix, %{region: "local", endpoint: endpoint}) do
    endpoint
  end
  defp build_host(_endpoint_prefix, %{region: "local"}) do
    "localhost"
  end
  defp build_host(endpoint_prefix, %{region: region, endpoint: endpoint}) do
    "#{endpoint_prefix}.#{region}.#{endpoint}"
  end

  defp build_url(host, path, %{:proto => proto, :port => port}) do
    "#{proto}://#{host}:#{port}#{path}"
  end

  defp add_query(url, [], _client) do
    url
  end
  defp add_query(url, query, client) do
    querystring = encode!(client, query, :query)
    "#{url}?#{querystring}"
  end

  defp encode!(client, payload, format \\ :json) do
    AWS.Client.encode!(client, payload, format)
  end

  defp decode!(client, payload) do
    AWS.Client.decode!(client, payload, :json)
  end
end
