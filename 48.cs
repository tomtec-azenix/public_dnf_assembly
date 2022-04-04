using System;
using System.Reflection;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;

[assembly:AssemblyVersionAttribute("4.5")]

internal class Program
{
    static void runTest() {
        string _url = "https://google.com/";
        var client = new HttpClient();
        HttpRequestMessage _req = new HttpRequestMessage();
        HttpResponseMessage _res = null;
        _req.Method = new HttpMethod("GET");
        _req.RequestUri = new Uri(_url);
        _res = client.SendAsync(_req).Result;
        int _code = (int)_res.StatusCode;
        int _bytes = _res.Content.ReadAsStringAsync().Result.Length;
        Console.WriteLine("Response code {0}, with {1} bytes", _code.ToString(), _bytes.ToString());
    }

    static void Main(string[] args) {
        var framework = Assembly.GetEntryAssembly(); //.GetCustomAttribute<System.Runtime.Versioning.TargetFrameworkAttribute>().FrameworkName.ToString();
        
        Console.WriteLine("Running .NET {0}", framework);
        Console.WriteLine("Running test 1.");
        runTest();
        System.Net.ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
        Console.WriteLine("Running test 2.");
        runTest();
        Console.WriteLine("Done");
    }
}
