export type ID = string;

export type ApiHealthResponse = {
  status: string;
};

export type UserRole =
  | "super_admin"
  | "admin"
  | "staff"
  | "security"
  | "sponsor"
  | "customer";
