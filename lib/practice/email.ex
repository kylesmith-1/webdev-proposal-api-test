#Attribution to this https://gist.github.com/mlankenau/91d450f6ad9edb3cbadbd9aa746b176f
#Which was suggested by elxir forums for a clean way to HTTP Post without one of the clunky
# Send Grid modules. Edited/altered for our usecase

defmodule Practice.Email do
    @mailer_url "https://api.sendgrid.com/v3/mail/send"
  
  
    @doc """
    Send a mail to a list of persons (recipients)
    * from from address
    * recipients array of email addresses
    * subject subject text
    * body text of the email
    """
    def send(from, to, subject, body_text) do
      HTTPotion.post(@mailer_url, [body: mail_json(from, to, subject, body_text), headers: headers()])
      |> case do
        %{status_code: code} when code in (200..299) ->
          :success
        error ->
          IO.puts "email failed to send: #{inspect error}"
         {:error, error}
      end
    end
  
    defp mail_json(from, to, subject, body_text) do
      %{
        "personalizations"=> [
          %{
            "to"=> [
              %{"email"=> to }
            ]
          }
        ],
        "from"=> %{
          "email"=> from
        },
        "subject"=> subject,
        "content"=> [
          %{
            "type"=> "text/plain",
            "value"=> body_text
          }
        ]
      }
      |> Poison.encode!
    end
  
    defp headers do
      [
        "Content-Type": "application/json",
        "Authorization": "Bearer #{System.get_env("SEND_GRID_API_KEY")}"
      ]
    end
  end
