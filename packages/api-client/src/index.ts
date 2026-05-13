import type { ApiHealthResponse } from "@vibinears/types";

export class VibinEarsApiClient {
  constructor(private readonly baseUrl: string) {}

  async health(): Promise<ApiHealthResponse> {
    const response = await fetch(`${this.baseUrl}/health`);

    if (!response.ok) {
      throw new Error(`Health check failed: ${response.status}`);
    }

    return response.json() as Promise<ApiHealthResponse>;
  }
}
